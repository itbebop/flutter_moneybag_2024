import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _transactionDataSource;
  final TransactionCategoryDataSource _transactionCategoryDatasource;
  final Map<int, TransactionCategory> _categoryCache = {};

  TransactionRepositoryImpl({required TransactionDataSource transactionDataSource, required TransactionCategoryDataSource transactionCategoryDatasource})
      : _transactionDataSource = transactionDataSource,
        _transactionCategoryDatasource = transactionCategoryDatasource;

  @override
  // Constructor
  Future<void> createTransaction({required TransactionDetail transaction}) async {
    await _transactionDataSource.createTransaction(transaction: transaction);
  }

  @override
  Future<List<TransactionDetail>> getTransactionList({required int userId}) async {
    final transactionList = await _transactionDataSource.getTransactionList(userId: userId);

    List<TransactionDetail> updatedTransactionList = await Future.wait(transactionList.map((transaction) async {
      if (!_categoryCache.containsKey(transaction.categoryId)) {
        _categoryCache[transaction.categoryId] = await _transactionCategoryDatasource.getTransactionCategory(categoryId: transaction.categoryId);
      }
      return transaction.copyWith(category: _categoryCache[transaction.categoryId]);
    }).toList());

    return updatedTransactionList;
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
