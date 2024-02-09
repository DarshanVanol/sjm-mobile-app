import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> data) async {
    await _firestore.collection('users').add(data);
  }

  Future<void> updateUser(Map<String, dynamic> data, String id) async {
    await _firestore.collection('users').doc(id).update(data);
  }

  Future<void> deleteUser(String id) async {
    await _firestore.collection('users').doc(id).delete();
  }

  Future<DocumentSnapshot> getUser(String id) async {
    return await _firestore.collection('users').doc(id).get();
  }

  //get user with role
  Future<QuerySnapshot> getUsers() async {
    return await _firestore.collection('users').get();
  }
}
