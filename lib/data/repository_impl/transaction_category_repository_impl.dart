import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class TransactionCategoryRepositoryImpl implements TransactionCategoryRepository {
  final TransactionCategoryDataSource _transactionCategoryDataSource;

  TransactionCategoryRepositoryImpl({required TransactionCategoryDataSource transactionCategoryDataSource}) : _transactionCategoryDataSource = transactionCategoryDataSource;

  @override
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryDataSource.createTransactionCategory(transactionCategory: transactionCategory);
  }

  @override
  Future<List<TransactionCategory>> getTransactionCategoryList() async {
    return await _transactionCategoryDataSource.getTransactionCategoryList();
  }

  @override
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryDataSource.updateTransactionCategory(transactionCategory: transactionCategory);
  }

  @override
  Future<void> deleteTransactionCategory({required String id}) async {
    await _transactionCategoryDataSource.deleteTransactionCategory(id: id);
  }
}