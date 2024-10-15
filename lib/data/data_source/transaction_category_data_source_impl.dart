import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

class TransactionCategoryDataSourceImpl implements TransactionCategoryDataSource {
  final _transactionRef = FirebaseFirestore.instance
      .collection('transactionCategory')
      .withConverter<TransactionCategory>(fromFirestore: (snapshot, _) => TransactionCategory.fromJson(snapshot.data()!), toFirestore: (snapshot, _) => snapshot.toJson());

  @override
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionRef.add(transactionCategory).then((value) => _transactionRef.doc(value.id).update({'id': value.id}));
  }

  @override
  Future<List<TransactionCategory>> getTransactionCategoryList() async {
    return await _transactionRef.orderBy('createAt', descending: true).get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionRef.doc(transactionCategory.id).set(transactionCategory);
  }

  @override
  Future<void> deleteTransactionCategory({required String id}) async {
    await _transactionRef.doc(id).delete();
  }
}
