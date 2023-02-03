import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, Map<String, dynamic>> getApi(
  String collection,
)  {
  Map<String, Map<String, dynamic>> result = {};
   FirebaseFirestore.instance
      .collection('finance')
      .get()
      .then((value) => value.docs.forEach((element) {
            result[element.id] = element.data();
          }));
  return result;
}
