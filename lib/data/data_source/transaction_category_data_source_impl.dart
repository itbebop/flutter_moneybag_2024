import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

class TransactionCategoryDataSourceImpl implements TransactionCategoryDataSource {
  final _transactionCategoryRef = FirebaseFirestore.instance.collection('transactionCategory').withConverter<TransactionCategory>(
        fromFirestore: (snapshot, _) => TransactionCategory.fromJson(snapshot.data()!),
        toFirestore: (transactionCategory, _) {
          final transactionCategoryMap = transactionCategory.toJson();
          transactionCategoryMap['AssetType'] = transactionCategory.type.displayName;
          return transactionCategoryMap;
        },
      );

  @override
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryRef.add(transactionCategory).then((value) => _transactionCategoryRef.doc(value.id).update({'id': value.id}));
  }

  @override
  Future<List<TransactionCategory>> getTransactionCategoryList() async {
    return await _transactionCategoryRef.orderBy('createAt', descending: true).get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryRef.doc(transactionCategory.id).set(transactionCategory);
  }

  @override
  Future<void> deleteTransactionCategory({required String id}) async {
    await _transactionCategoryRef.doc(id).delete();
  }
}
