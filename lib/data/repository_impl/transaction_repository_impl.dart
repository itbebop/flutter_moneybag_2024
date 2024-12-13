import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _transactionDataSource;

  TransactionRepositoryImpl({required TransactionDataSource transactionDataSource}) : _transactionDataSource = transactionDataSource;

  @override
  // Constructor
  Future<void> createTransaction({required TransactionDetail transaction}) async {
    await _transactionDataSource.createTransaction(transaction: transaction);
  }

  @override
  Future<List<TransactionDetail>> getTransactionList({required int userId}) async {
    return await _transactionDataSource.getTransactionList(userId: userId);
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction, required int assetId, required int userId}) async {
    await _transactionDataSource.updateTransaction(transaction: transaction, assetId: assetId, userId: userId);
  }

  @override
  Future<void> deleteTransaction({required int transactionId, required int assetId, required int userId}) async {
    await _transactionDataSource.deleteTransaction(transactionId: transactionId, assetId: assetId, userId: userId);
  }
}
