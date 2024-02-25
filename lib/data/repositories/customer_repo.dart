import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sjm/data/models/customer_model.dart';

class CustomerRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addCustomer(Customer customer) async {
    await _firestore.collection('customers').add(customer.toMap());
  }

  // //get search customes by name list
  // Stream<List<Customer>> getCustomers() {
  //   return _firestore.collection('customers').snapshots().map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => Customer.fromSnapshot(doc.data()))
  //         .toList();
  //   });
  // }
}
