import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TreasuryController with ChangeNotifier {
  getTreasury() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("treasuryactions").get();
    return qn.docs;
  }

  editTreasury(String id, double balance, String reason) async {
    FirebaseFirestore.instance
        .collection("treasuryactions")
        .doc(id.trim())
        .get()
        .then((value) {
      FirebaseFirestore.instance.collection("treasuryactions").doc(id).set(
        {'balance': value['balance'] + balance},
        SetOptions(merge: true),
      ).then((value1) {
        if (balance.isNegative) {
          addReportTreasury(id, 'خصم', reason, "تعديل", 'Admin', balance, '',
              value['name'], value['balance'], value['balance'] + balance);
        } else {
          addReportTreasury(id, 'اضافه', reason, "تعديل", 'Admin', balance, '',
              value['name'], value['balance'], value['balance'] + balance);
        }
      });
    });
  }

  addReportTreasury(
      String id,
      String action,
      String reason,
      String type,
      String byWho,
      double balance,
      String refrance,
      String name,
      double balanceBefore,
      double balanceAfter) async {
    FirebaseFirestore.instance
        .collection("treasuryactions")
        .doc(id)
        .collection('report')
        .add(
      {
        'action': action,
        'id': id,
        'reason': reason,
        'type': type,
        'byWho': byWho,
        'balance': balance,
        'refrance': refrance,
        'name': name,
        'balanceBefore': balanceBefore,
        'balanceAfter': balanceAfter,
        'date': DateTime.now().toString(),
      },
    );
  }
}
