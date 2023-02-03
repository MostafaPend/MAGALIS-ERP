import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../view/home/homepage.dart';

class PurchaseController with ChangeNotifier {
  double? beforeBalance;
  double? afterBalance;

  List<dynamic> ? products ;
  String ? supplierName;
  String ? date;
  int ? sfess;
  int ? rbalance;
  int ? payment;
  int ? podownpayment;
  String ? poID;
  Future addBill(String id, double balance, String supID, double residual,
      double total) async {
    print("1");
    await FirebaseFirestore.instance
        .collection('treasuryactions')
        .doc(id)
        .get()
        .then((value1) async {
      print("2");
      await FirebaseFirestore.instance
          .collection('treasuryactions')
          .doc(id)
          .set(
        {'balance': value1['balance'] - balance},
        SetOptions(merge: true),
      );

    }).then((value2) async {
      print("3");
      await FirebaseFirestore.instance
          .collection('suppliers')
          .doc(supID)
          .get()
          .then((value3) async {
        print("4");
        await FirebaseFirestore.instance.collection('suppliers').doc(supID).set(
          {'balance': value3['balance'] + residual},
          SetOptions(merge: true),
        );
      });
    }).then((value) async {
      print("5");
      await FirebaseFirestore.instance
          .collection('warehouses')
          .doc('مخزن مواد خام')
          .get()
          .then((val) async {
        beforeBalance = val['balance'];
        afterBalance = val['balance'] + total;
        await FirebaseFirestore.instance
            .collection('warehouses')
            .doc('مخزن مواد خام')
            .set(
          {'balance': val['balance'] + total},
          SetOptions(merge: true),
        );
      });
    });
  }

  addPurchasing({
    required String date,
    required String state,
    required String trasury,
    required String supName,
    required double podownpayment,
    required int totalQuantity,
    required double poshippingfees,
    required double remainbalance,
    required double total,
    required List purData,
    required String measurement,
    required BuildContext context
  }) async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("addpurchasing").get();
    DocumentSnapshot qns = await firestore.collection("suppliers").doc(supName).get();


    await FirebaseFirestore.instance.collection('addpurchasing').doc("PO${(qn.docs.length).toString()}").set({
      'date': date,
      'suppliername': supName,
      'postatus': state,
      'total': total+poshippingfees,
      'trasury': trasury,
      'podownpayment': podownpayment,
      'poshippingfees': poshippingfees,
      'recevingDate': '',
      'remainbalance': remainbalance+poshippingfees,
      'supplierBalanceBefore': qns["balance"],
      'supplierBalanceAfter': qns["balance"]+podownpayment,
      "id":"PO${(qn.docs.length).toString()}",
      'image': '',
    }).then((value) async {
      purData.forEach((element) async {


        print("quantity ${element["quantity"]}");
        DocumentSnapshot rr = await FirebaseFirestore.instance.collection('warehouses')
            .doc('مخزن مواد خام').collection("Materials").doc(element["name"]).get();
        print("2");
        print(((element["quantity"])));
        await FirebaseFirestore.instance
            .collection('warehouses')
            .doc('مخزن مواد خام')
            .collection("Reports")
            .add(
          {
            'quantity': (element["quantity"]),
            'afterQuantity': rr["quantity"]+(element["quantity"]),
            'beforeQuantity': rr["quantity"],
            'date': DateTime.now().toIso8601String(),
            'totalcost': element['price']*rr["quantity"],
            'name':element['name'],
            'type': "Purchase",
            'unitcost': element['price'],
            "id":"PO${(qn.docs.length).toString()}",
          },
        );
        print("3");

        await FirebaseFirestore.instance
            .collection('addpurchasing')
            .doc("PO${(qn.docs.length).toString()}")
            .collection('rawmaterials')
            .add({
          'unit': element['measurement'],
          'price': element['price'],
          'requirequantity': element['quantity'],
          'name': element['name'],
          'image': element['image'],
          'totalprice':  (element['quantity']* element['price']),
          'id':"PO${(qn.docs.length).toString()}",
        });
        print("4");
        if(state=="تم الطلب"){

        }else{
          print(trasury);
          await FirebaseFirestore.instance.collection("treasuryactions").doc(trasury).get().then((valuexxx) =>
          {
            FirebaseFirestore.instance
                .collection('treasuryactions')
                .doc(trasury)
                .collection("Reports")
                .add(
              {
                'afterQuantity': valuexxx["balance"]-podownpayment,
                'beforeQuantity': valuexxx["balance"],
                'date': DateTime.now().toIso8601String(),
                'totalcost': podownpayment,
                'type': "Purchase",
                "actionTaker":"ADMIN",
                "id":"PO${(qn.docs.length).toString()}",
              },
            )
          });


          await FirebaseFirestore.instance.collection('addpurchasing').doc("PO${(qn.docs.length).toString()}").update({
            'recevingDate': date,
          });
          await FirebaseFirestore.instance
              .collection('warehouses')
              .doc('مخزن مواد خام')
              .collection("Materials")
              .doc(element["name"])
              .set(
            {'quantity': FieldValue.increment(int.parse(element["quantity"]))},
            SetOptions(merge: true),
          );

          await FirebaseFirestore.instance
              .collection("Materials")
              .doc(element["name"])
              .set(
            {'quantity': FieldValue.increment(int.parse(element["quantity"]))},
            SetOptions(merge: true),
          );
        }
      });



      await FirebaseFirestore.instance.collection('actions').add({
        'treasury': trasury,
        'podownpayment':podownpayment,
        'totalmaterialcost': total + poshippingfees,
        'totalcost': total,
        'suppliername': supName,
        'quantity': totalQuantity,
        'poimage': '',
        'notes': '',
        'name': '',
        'movecost': 0,
        'measurement': measurement,
        'materialcost': 0,
        'details': 'خامات',
        'date': date,
        'recevingDate': '',
        'currentvalue': 0,
        'afterquantity': afterBalance,
        'beforequantity': beforeBalance,
        'actiontype': 'شراء',
        'actiontaker': 'admin',
        'actionreference': "PO${(qn.docs.length).toString()}",
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );

    });
  }
}