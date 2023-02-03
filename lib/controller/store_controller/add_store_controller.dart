import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStoreController with ChangeNotifier {
  List storeData = [];
  List rowMaterial = [];

  void addWarehouse(
      {required String name,
        required String description,
        required String unit,
        required BuildContext context}) async {
    await FirebaseFirestore.instance.collection('warehouses').doc(name).set({
      'balance': 0,
      'description': description,
      'unit': unit,
      'name': name,
      'date': DateTime.now().toIso8601String().toString()
    });
    notifyListeners();
  }

  Future getStoreDetails() async {
    await FirebaseFirestore.instance
        .collection('warehouses')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        storeData.add(element.data());
      });
    });
    //print(storeData);
    notifyListeners();
  }

  getRowMaterialDetails(String warehouse, String pname) async {
    //print(warehouse);
    //print(pname);
    QuerySnapshot qn = await FirebaseFirestore.instance
        .collection('warehouses')
        .doc(warehouse)
        .collection('Reports')
        .where("name", isEqualTo: pname)
        .get();
    return qn.docs;
  }

  getRowMaterials(String type) async {
    rowMaterial.clear();
    await FirebaseFirestore.instance
        .collection('warehouses')
        .doc(type)
        .collection('Materials')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        rowMaterial.add(element.data());
      });
    });

    notifyListeners();
  }
}