import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

abstract interface class TransactionRepository {
  Future<void> createTransaction({required TransactionDetail transaction});
  Future<List<TransactionDetail>> getTransactionlList();
  Future<void> updateTransaction({required TransactionDetail transaction});
  Future<void> deleteTransaction({required String transactionId});
}
