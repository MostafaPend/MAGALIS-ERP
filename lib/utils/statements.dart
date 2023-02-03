import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getRevenue() async{
  int total = 0;
  await FirebaseFirestore.instance
      .collection('supplychain')
      .get()
      .then((value) => value.docs.forEach((element) {
    total = total + (element.data()['totalinvoiceamount'])as int;
  }));
  print(total);
  return total;
}