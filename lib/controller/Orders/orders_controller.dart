import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erb_system/view/orders/orders_details.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class AddOrderController with ChangeNotifier {

  String ? id;
  String ? customername;
  String ? address;
  String ? notes;
  String ? city;
  int ? downpayment;
  String ? date;
  String ? government;
  int ? netamount;
  String ? orderstatus;
  String ? ordersource;
  String ? phonenumber;
  String ? phonenumber1;
  int ? shippingfees;
  String ? shippingtyp;
  String ? phoneNumber;
  String ? phoneNumber1;
  int ? totalinvoice;
  String ? routenumber;
  String ? courriers;
  String ? orderstatusdate;
  String ? treasury;
  List<dynamic> ? orders ;
  BuildContext ? context;

  

  void addOrder(
      {required String city,
        required String customername,
        required String customertype,
        required DateTime date,
        required int downpayment,
        required String government,
        required int netamount,
        required String notes,
        required int totalinvoiceamount,
        required String ordersource,
        required String ordertype,
        required String treasury,
        required String phonenumber,
        required String phonenumber1,
        required int shippingfees,
        required String shippingtype ,
        required List items,
        required int discount,
        required String doneby,
        required String address,
        required BuildContext context,

      }) async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("supplychain").get();

    try{


      await FirebaseFirestore.instance.collection('supplychain').doc((1000+qn.docs.length).toString()).set({
        'address':address,
        'addbilloflading': "",
        "cancellationnote": "",
        "doneby": doneby,
        'city': city,
        "courrier": "",
        "customername": customername,
        "customertype": customertype,
        "date": date,
        "downpayment": downpayment,
        "government": government,
        "netamount": netamount,
        'notes': notes,
        'orderstatus':"طلب جديد",
        'ordersource':ordersource,
        'ordertype':ordertype,
        'paymentstatus':"",
        'postpone':0,
        'rejectionnote':"",
        'routenumber':"",
        'statusdate':"",
        'totalinvoiceamount':totalinvoiceamount,
        'treasury':treasury,
        'uploadimage':"",
        'phonenumber':phonenumber,
        'phonenumber1':phonenumber1,
        'shippingfees':shippingfees,
        'shippingtype':shippingtype,
        'discount':discount,
        "id":(1000+qn.docs.length).toString(),

      });


      for(int i = 0;i<items.length;i++){
        FirebaseFirestore.instance.collection("supplychain").doc((1000+qn.docs.length).toString()).collection("products").add(
            {
              "image":items[i]["image"],
              "price":items[i]["price"],
              "productname":items[i]["name"],
              "quantity":items[i]["quantity"],
              "totalprice":items[i]["price"]*items[i]["quantity"],
              "unit":items[i]["measurement"],

            });
      }

      FirebaseFirestore.instance.collection("supplychain").doc((1000+qn.docs.length).toString()).collection("Tracking").add(
          {
            "by":doneby,
            "type":"طلب جديد",
            "date":DateTime.now().toIso8601String().toString(),

          });
    }catch(e){
      print(e.toString()
      );
    }
    if(downpayment>0){
      DocumentSnapshot rr = await FirebaseFirestore.instance.collection('treasuryactions').doc(treasury).get();
      FirebaseFirestore.instance.collection('treasuryactions').doc(treasury).update({
        'balance': rr["balance"]+downpayment,
      });
      FirebaseFirestore.instance
          .collection('treasuryactions')
          .doc(treasury)
          .collection("Reports")
          .add(
        {
          'afterQuantity': rr["balance"]+downpayment,
          'beforeQuantity': rr["balance"],
          'date': DateTime.now().toIso8601String(),
          'totalcost': downpayment,
          'type': "Supplychain",
          "actionTaker":"ADMIN",
          "id":"PO${(qn.docs.length).toString()}",
        },
      );

    }
    else{
      print("NO PAYMENT");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  Talabat()),
    );
  }

  getMaterialsWarehouse() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("warehouses").doc("مخزن منتج تام").collection("Materials").get();
    return qn.docs;
  }

  getSupplyChainOrders() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("supplychain").get();
    return qn.docs;
  }

  getCouriers() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("courriers").get();
    return qn.docs;
  }
  getCouriersBalance(String id,String ? word) async {
    if(word==null){
      var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("courrierbalanceaction").where("courrier",isEqualTo: id).get();
    return qn.docs;
    }
    else{ var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("courrierbalanceaction").where("courrier",isEqualTo: id).where("paymentStatus",isEqualTo: word).get();
    return qn.docs;
    }
  }
  getCouriersName() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("courriers").get();


    return qn.docs;
  }
  notifyListeners();
  }


