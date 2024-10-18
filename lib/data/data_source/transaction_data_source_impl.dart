import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class TransactionDataSourceImpl implements TransactionDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TransactionRef 초기화
  CollectionReference<TransactionDetail> _transactionRef(String userId, String assetId) {
    return _firestore.collection('users').doc(userId).collection('assets').doc(assetId).collection('transactions').withConverter<TransactionDetail>(
          fromFirestore: (snapshot, _) => TransactionDetail.fromJson(snapshot.data()!),
          toFirestore: (transaction, _) {
            final transactionMap = transaction.toJson();
            transactionMap['category'] = transaction.category.toJson();
            return transactionMap;
          },
        );
  }

  @override
  Future<void> createTransaction({required TransactionDetail transaction, required String userId, required String assetId}) async {
    await _transactionRef(userId, assetId).add(transaction).then((value) => _transactionRef(userId, assetId).doc(value.id).update({'transactionId': value.id}));
  }

  @override
  Future<List<TransactionDetail>> getTransactionList({required String userId, required String assetId}) async {
    return await _transactionRef(userId, assetId).get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction, required String userId, required String assetId}) async {
    await _transactionRef(userId, assetId).doc(transaction.transactionId).set(transaction);
  }

  @override
  Future<void> deleteTransaction({required String transactionId, required String userId, required String assetId}) async {
    await _transactionRef(userId, assetId).doc(transactionId).delete();
  }
}
