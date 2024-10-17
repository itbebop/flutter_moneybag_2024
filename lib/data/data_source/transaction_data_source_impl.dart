import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class TransactionDataSourceImpl implements TransactionDataSource {
  final _transactionRef = FirebaseFirestore.instance.collection('transaction').withConverter<TransactionDetail>(
        fromFirestore: (snapshot, _) => TransactionDetail.fromJson(snapshot.data()!),
        toFirestore: (transaction, _) {
          final transactionMap = transaction.toJson();
          transactionMap['category'] = transaction.category.toJson();
          return transactionMap;
        },
      );
  @override
  Future<void> createTransaction({required TransactionDetail transaction}) async {
    // await _transactionRef.add(transaction).then((value) => _transactionRef.doc(value.id).update({'transactionId': value.id}));
    await _transactionRef
        .doc(transaction.transactionId) // transactionId를 문서의 ID로 사용
        .set(transaction); // 데이터를 저장
  }

  @override
  Future<List<TransactionDetail>> getTransactionList() async {
    return await _transactionRef.get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction}) async {
    await _transactionRef.doc(transaction.transactionId).set(transaction);
  }

  @override
  Future<void> deleteTransaction({required String transactionId}) async {
    await _transactionRef.doc(transactionId).delete();
  }
}
