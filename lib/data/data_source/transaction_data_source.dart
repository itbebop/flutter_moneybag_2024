import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

abstract interface class TransactionDataSource {
  Future<void> createTransaction({required TransactionDetail transaction});
  Future<List<TransactionDetail>> getTransactionList({required int userId});
  Future<void> updateTransaction({required TransactionDetail transaction, required int assetId, required int userId});
  Future<void> deleteTransaction({required int transactionId, required int assetId, required int userId});
}
