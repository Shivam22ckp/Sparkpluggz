import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addMessage(Map<String, dynamic> addressInfoMap) async {
    await FirebaseFirestore.instance
        .collection("Addresses")
        .add(addressInfoMap);
  }

  Future addtoOrder(String userIdKey, String orderId,
      Map<String, dynamic> orderInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userIdKey)
        .collection("orders")
        .doc(orderId)
        .set(orderInfoMap);
  }

  Future addtoAdminOrder(Map<String, dynamic> orderInfoMap) async {
    return FirebaseFirestore.instance.collection("Orders").add(orderInfoMap);
  }

  Future<Stream<QuerySnapshot>> getAdminOrder() async {
    return FirebaseFirestore.instance.collection("Orders").snapshots();
  }

  Future<Stream<QuerySnapshot>> getAdminUser() async {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future deleteOrder(String id, String orderid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("orders")
        .doc(orderid)
        .delete();
  }

  Future<Stream<QuerySnapshot>> getOrder(String userIdkey) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userIdkey)
        .collection("orders")
        .snapshots();
  }

  Future<QuerySnapshot> getUserInfo(String username) async {
    return await FirebaseFirestore.instance
        .collection("Addresses")
        .where("name", isEqualTo: username)
        .get();
  }

  Future deleteAddress(String id) async {
    await FirebaseFirestore.instance.collection("Addresses").doc(id).delete();
  }
}
