import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class TransactionDetailRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _transactionDetailDataSource;

  TransactionDetailRepositoryImpl({required TransactionDataSource transactionDetailDataSource}) : _transactionDetailDataSource = transactionDetailDataSource;

  @override
  Future<void> createTransaction({required TransactionDetail transaction}) async {
    await _transactionDetailDataSource.createTransaction(transaction: transaction);
  }

  @override
  Future<List<TransactionDetail>> getTransactionlList() async {
    return await _transactionDetailDataSource.getTransactionList();
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction}) async {
    await _transactionDetailDataSource.updateTransaction(transaction: transaction);
  }

  @override
  Future<void> deleteTransaction({required String transactionId}) async {
    await _transactionDetailDataSource.deleteTransaction(transactionId: transactionId);
  }
}
