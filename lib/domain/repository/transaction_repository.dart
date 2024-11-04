import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

abstract interface class TransactionRepository {
  Future<void> createTransaction({required TransactionDetail transaction, required String assetId, required String userId});
  Future<List<TransactionDetail>> getTransactionList({required List<String> assetIdList, required String userId});
  Future<void> updateTransaction({required TransactionDetail transaction, required String assetId, required String userId});
  Future<void> deleteTransaction({required String transactionId, required String assetId, required String userId});
}
