import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

abstract interface class TransactionRepository {
  Future<void> createTransaction({required TransactionDetail transaction, required String userId, required String assetId});
  Future<List<TransactionDetail>> getTransactionList({required String userId, required String assetId});
  Future<void> updateTransaction({required TransactionDetail transaction, required String userId, required String assetId});
  Future<void> deleteTransaction({required String transactionId, required String userId, required String assetId});
}
