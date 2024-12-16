import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource _transactionDataSource;
  final TransactionCategoryDataSource _transactionCategoryDatasource;

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
    // 1. 주어진 userId로 트랜잭션 리스트를 가져옵니다.
    final transactionList = await _transactionDataSource.getTransactionList(userId: userId);

    // 2. 각 트랜잭션의 categoryId에 해당하는 카테고리 정보를 가져옵니다.
    List<TransactionDetail> updatedTransactionList = await Future.wait(transactionList.map((transaction) async {
      final category = await _transactionCategoryDatasource.getTransactionCategory(categoryId: transaction.categoryId);

      // 3. 각 트랜잭션에 TransactionCategory 객체를 추가합니다.
      return transaction.copyWith(category: category);
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
