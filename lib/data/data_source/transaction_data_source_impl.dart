import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class TransactionDataSourceImpl implements TransactionDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TransactionRef 초기화
  CollectionReference<TransactionDetail> _transactionRef(String assetId) {
    return _firestore.collection('assets').doc(assetId).collection('transactions').withConverter<TransactionDetail>(
          fromFirestore: (snapshot, _) => TransactionDetail.fromJson(snapshot.data()!),
          toFirestore: (transaction, _) {
            final transactionMap = transaction.toJson();
            transactionMap['category'] = transaction.category.toJson();
            return transactionMap;
          },
        );
  }

  @override
  Future<void> createTransaction({required TransactionDetail transaction, required String assetId}) async {
    // 고유 transactionId를 생성
    final transactionId = '${transaction.category.categoryId}_${transaction.createdAt}';

    // transactionId를 사용하여 문서를 추가
    await _transactionRef(assetId).doc(transactionId).set(transaction);

    final assetRef = FirebaseFirestore.instance.collection('assets');

    // totalAmount에 transaction.amount를 더하는 로직
    await assetRef.doc(assetId).update({
      'totalAmount': FieldValue.increment(transaction.amount),
      // transaction.amount가 양수이면 totalIncome에 더하고, 음수이면 totalExpense에 더하는 로직 추가
      'totalIncome': FieldValue.increment(transaction.amount > 0 ? transaction.amount : 0),
      'totalExpense': FieldValue.increment(transaction.amount < 0 ? -transaction.amount : 0),
    });
  }

  @override
  Future<List<TransactionDetail>> getTransactionList({required List<String> assetIdList}) async {
    List<TransactionDetail> allTransactions = [];

    for (String assetId in assetIdList) {
      final transactions = await _transactionRef(assetId).orderBy('updatedAt', descending: true).get();
      allTransactions.addAll(transactions.docs.map((e) => e.data()));
    }

    return allTransactions;
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction, required String assetId}) async {
    await _transactionRef(assetId).doc(transaction.transactionId).set(transaction);
  }

  @override
  Future<void> deleteTransaction({required String transactionId, required String assetId}) async {
    await _transactionRef(assetId).doc(transactionId).delete();
  }
}
