import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sjm/data/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> getUser(String email) async {
    final data = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.docs);

    if (data.isEmpty) {
      return null;
    }
    final user = data.first.data();
    return User.fromJson(user);
  }

  Future<User> addUser(Map<String, dynamic> data) async {
    final some = await _firestore.collection('users').add(data);
    final user = await some.get().then((value) => User.fromJson(value.data()!));
    return user;
  }

  Future<void> updateUser(Map<String, dynamic> data, String id) async {
    await _firestore.collection('users').doc(id).update(data);
  }

  Future<void> deleteUser(String id) async {
    await _firestore.collection('users').doc(id).delete();
  }

  //get user with role
  Future<QuerySnapshot> getUsers() async {
    return await _firestore.collection('users').get();
  }
}
