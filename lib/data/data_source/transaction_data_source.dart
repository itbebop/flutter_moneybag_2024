import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

abstract interface class TransactionDataSource {
  Future<void> createTransaction({required TransactionDetail transaction, required String assetId});
  Future<List<TransactionDetail>> getTransactionList({required List<String> assetIdList});
  Future<void> updateTransaction({required TransactionDetail transaction, required String assetId});
  Future<void> deleteTransaction({required String transactionId, required String assetId});
}
