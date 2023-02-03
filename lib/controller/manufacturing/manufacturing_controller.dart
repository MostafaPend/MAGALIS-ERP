import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManufacturingController with ChangeNotifier {



  getManfucture() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("manufacturing").get();
    return qn.docs;
  }

  getManfuctureOrders() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("Manufacturingorders").get();
    return qn.docs;
  }
  getManfuctureType(String x) async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("manufacturing").where("producttype",isEqualTo: x).get();
    return qn.docs;
  }
   addManufacturing(String billofmaterialtype, String productname, String producttype, int variableCost, int totalCost,List list) {
    // Add the main manufacturing document to the 'manufacturing' collection
    FirebaseFirestore.instance.collection('manufacturing').doc(productname).set({
      'billofmaterialtype': billofmaterialtype,
      'productname': productname,
      'producttype': producttype,
      'variableCost': variableCost,
      'totalCost': totalCost,
    }).then((documentReference) {
      // Add a subcollection called 'costs' to the main manufacturing document
      print(list.length.toString());
      print(productname.toString());
      list.forEach((element) {
        FirebaseFirestore.instance.collection('manufacturing').doc(productname).collection('billofmaterial').add({
         'costtype': billofmaterialtype,
         'image': '',
         "measurement":element["measurement"],
         "name":element["name"],
         "totalcost":element["price"]*element["quantity"],
         "type":element["type"],
         "unitcost":element["price"],
          "variablecost":variableCost,
          "quantityrequired":element["quantity"],

       });

     });
    });
  }

  addManufacturingOrder(String doneby, String manufacturingstatus, String productname, String producttype, int quantity,int totalcost,List item) async{
    if(manufacturingstatus == "في التصنيع"){
      // Add the main manufacturing document to the 'manufacturing' collection
      await FirebaseFirestore.instance.collection('Manufacturingorders').add({
        'date': DateTime.now().toIso8601String(),
        'enddate': "",
        'doneby': doneby,
        'manufacturingstatus': manufacturingstatus,
        'productname': productname,
        'producttype': producttype,
        'quantity': quantity,
        'totalcost': totalcost,
      });

      for(int i =0;i<item.length;i++){
        DocumentSnapshot rr = await FirebaseFirestore.instance.collection('Materials').doc(item[i]["name"]).get();

        FirebaseFirestore.instance.collection('Materials').doc(item[i]["name"]).update({
          'quantity': rr["quantity"]-(item[i]["quantityrequired"]*quantity),
        });

        FirebaseFirestore.instance.collection('warehouses').doc(item[i]["type"]).collection("Materials").doc(item[i]["name"]).update({
          'quantity': rr["quantity"]-(item[i]["quantityrequired"]*quantity),
        });
        FirebaseFirestore.instance.collection('warehouses').doc(item[i]["type"]).collection("Reports").add({
          'afterQuantity': rr["quantity"]-(item[i]["quantityrequired"]*quantity),
          'beforeQuantity': rr["quantity"],
          'date': DateTime.now().toIso8601String(),
          'totalcost': totalcost,
          'name':item[i]['name'],
          'type': "Manufacture",
          'quantity': (item[i]["quantityrequired"]*quantity),
          'unitcost': item[i]["unitcost"],
        });

      }

    }
    else if (manufacturingstatus == "تم الانتهاء"){
      DocumentSnapshot rr = await FirebaseFirestore.instance.collection('warehouses').doc(producttype).get();


      await FirebaseFirestore.instance.collection('Manufacturingorders').add({
        'date': DateTime.now().toIso8601String(),
        'enddate': "",
        'doneby': doneby,
        'manufacturingstatus': manufacturingstatus,
        'productname': productname,
        'producttype': producttype,
        'quantity': quantity,
        'totalcost': totalcost,
      });

      for(int i =0;i<item.length;i++){
        DocumentSnapshot rr = await FirebaseFirestore.instance.collection('Materials').doc(item[i]["name"]).get();

        FirebaseFirestore.instance.collection('Materials').doc(item[i]["name"]).update({
          'quantity': rr["quantity"]-(item[i]["quantityrequired"]*quantity),
        });

        FirebaseFirestore.instance.collection('warehouses').doc(item[i]["type"]).collection("Materials").doc(item[i]["name"]).update({
          'quantity': rr["quantity"]-(item[i]["quantityrequired"]*quantity),
        });
        FirebaseFirestore.instance.collection('warehouses').doc(item[i]["type"]).collection("Reports").add({
          'afterQuantity': rr["quantity"]-(item[i]["quantityrequired"]*quantity),
          'beforeQuantity': rr["quantity"],
          'date': DateTime.now().toIso8601String(),
          'totalcost': totalcost,
          'name':item[i]['name'],
          'type': "Manufacture",
          'quantity': (item[i]["quantityrequired"]*quantity),
          'unitcost': item[i]["unitcost"],
        });
        //  FirebaseFirestore.instance.collection('warehouses').doc(item[i]["type"]).update({
        //  'balance': rr["quantity"]-item[i]["quantityrequired"],
        // });
      }

      DocumentReference docRef = await FirebaseFirestore.instance.collection('warehouses').doc(producttype).
      collection("Materials").doc(productname);
      print(quantity.toString());

      docRef.get().then((docSnapshot) {
        if (docSnapshot.exists) {
          FirebaseFirestore.instance.collection('warehouses').doc(producttype).
          collection("Materials").doc(productname).update({
            'quantity': FieldValue.increment(quantity),
          });

        } else {
          // Document does not exist
          FirebaseFirestore.instance.collection('warehouses').doc(producttype).
          collection("Materials").doc(productname).set({
            "name":productname,
            "measurement":"",
            "price":totalcost,
            'quantity':quantity,
          });
        }
      });

      print(productname);



      FirebaseFirestore.instance.collection('warehouses').doc(producttype).update({
        'quantity': rr["balance"]+quantity,
      });
    }
    else{

    }
  }

}
