import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sjm/data/models/expense_model.dart';

class ExpenseRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addExpense(Map<String, dynamic> data) async {
    await _firestore.collection('expenses').add(data);
  }

  Future<void> updateExpense(Map<String, dynamic> data, String id) async {
    await _firestore.collection('expenses').doc(id).update(data);
  }

  Future<void> deleteExpense(String id) async {
    await _firestore.collection('expenses').doc(id).delete();
  }

  // get stream of expenses
  Stream<List<Expense>> getExpensesStream() {
    return _firestore.collection('expenses').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Expense.fromJson(doc.data()).copyWith(id: doc.id))
          .toList();
    });
  }

  // get expense
  Future<Map<String, dynamic>?> getExpense(String id) async {
    final data = await _firestore.collection('expenses').doc(id).get();
    if (data.exists) {
      return data.data();
    }
    return null;
  }
}
