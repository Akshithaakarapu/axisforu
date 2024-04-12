import 'package:cloud_firestore/cloud_firestore.dart';

class Databsemethods {
  Future adduserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("e-mail", isEqualTo: email)
        .get();
  }
}
