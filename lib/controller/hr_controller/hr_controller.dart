import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddHRController with ChangeNotifier {
  List hrData = [];
  int standerSalary = 0;
  int totalSalary = 0;
  int variableSalary = 0;
  bool isGet = false;
  Map hr = {};

  void addHR(
      {required String name,
        required String level,
        required String salaryType,
        required double standerSalary,
        double? loan,
        required double variableSalary,
        required double totalSalary,
        required String department,
        required String covenant}) async {
    await FirebaseFirestore.instance.collection('addemployee').add({
      'name': name,
      "level": level,
      'salaryType': salaryType,
      "standerSalary": standerSalary,
      "loan": loan = 0,
      "variableSalary": variableSalary,
      "totalSalary": totalSalary,
      "department": department,
      "covenant": covenant,
      'date': DateTime.now().toIso8601String().toString()
    });
  }

  Future getHR() async {
    var firestore = FirebaseFirestore.instance;
    await firestore.collection("addemployee").get().then((value) {
      hrData = value.docs;
      hrData.forEach((element) {
        standerSalary =
            standerSalary + int.parse(element['standerSalary'].toString());
        totalSalary =
            totalSalary + int.parse(element['totalSalary'].toString());
        variableSalary =
            variableSalary + int.parse(element['variableSalary'].toString());
      });
    }).whenComplete(() {
      isGet = true;
    });
    notifyListeners();
  }

  Future getHROnly() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("addemployee").get();
    return qn.docs;
  }

  Future getHROnly1(String id) async {
    FirebaseFirestore.instance
        .collection("addemployee")
        .where('name', isEqualTo: id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        //print(element.data());
        hr = element.data();
        // hr.add(element.data());
      });
    });
    // //print(hr);
    notifyListeners();
  }

  Future<void> salaries({
    required String name,
    required double monthSalary,
    required double totalSalary,
    required String fromTreasury,
    required double residual,
    required double salaryOrLoan,
    required double salaryDisbursementAmount,
  }) async {
    await FirebaseFirestore.instance.collection('salaries').add({
      'name': name,
      "monthSalary": monthSalary,
      "totalSalary": totalSalary,
      "residual": residual,
      'fromTreasury': fromTreasury,
      "salaryOrLoan": salaryOrLoan,
      "salaryDisbursementAmount": salaryDisbursementAmount,
      'date': DateTime.now().toIso8601String().toString()
    });
  }

  getSalaries() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("salaries").get();
    return qn.docs;
  }

  void addCashCustody({
    required String name,
    required double monthSalary,
    required double totalSalary,
    required String fromTreasury,
    required double residual,
    required double salaryOrLoan,
    required double advanceDisbursement,
  }) async {
    await FirebaseFirestore.instance.collection('salaries').add({
      'name': name,
      "monthSalary": monthSalary,
      "totalSalary": totalSalary,
      "residual": residual,
      'fromTreasury': fromTreasury,
      "salaryOrLoan": salaryOrLoan,
      "advanceDisbursement": advanceDisbursement,
      'date': DateTime.now().toIso8601String().toString()
    });
  }
}