import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class TransactionDetailRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _transactionDetailDataSource;

  TransactionDetailRepositoryImpl({required TransactionDataSource transactionDetailDataSource}) : _transactionDetailDataSource = transactionDetailDataSource;

  @override
  // Constructor
  Future<void> createTransaction({required TransactionDetail transaction, required String userId, required String assetId}) async {
    await _transactionDetailDataSource.createTransaction(transaction: transaction, userId: userId, assetId: assetId);
  }

  @override
  Future<List<TransactionDetail>> getTransactionList({required String userId, required String assetId}) async {
    return await _transactionDetailDataSource.getTransactionList(userId: userId, assetId: assetId);
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction, required String userId, required String assetId}) async {
    await _transactionDetailDataSource.updateTransaction(transaction: transaction, userId: userId, assetId: assetId);
  }

  @override
  Future<void> deleteTransaction({required String transactionId, required String userId, required String assetId}) async {
    await _transactionDetailDataSource.deleteTransaction(transactionId: transactionId, userId: userId, assetId: assetId);
  }
}
