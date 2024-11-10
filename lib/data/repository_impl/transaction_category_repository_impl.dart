import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class TransactionCategoryRepositoryImpl implements TransactionCategoryRepository {
  final TransactionCategoryDataSource _transactionCategoryDataSource;

  TransactionCategoryRepositoryImpl({required TransactionCategoryDataSource transactionCategoryDataSource}) : _transactionCategoryDataSource = transactionCategoryDataSource;

  @override
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory, required String userId}) async {
    await _transactionCategoryDataSource.createTransactionCategory(transactionCategory: transactionCategory, userId: userId);
  }

  @override
  Future<List<TransactionCategory>> getTransactionCategoryList({required String userId}) async {
    return await _transactionCategoryDataSource.getTransactionCategoryList(userId: userId);
  }

  @override
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory, required String userId}) async {
    await _transactionCategoryDataSource.updateTransactionCategory(transactionCategory: transactionCategory, userId: userId);
  }

  @override
  Future<void> deleteTransactionCategory({required String categoryId, required String userId}) async {
    await _transactionCategoryDataSource.deleteTransactionCategory(categoryId: categoryId, userId: userId);
  }

  @override
  Future<void> createSubTransactionCategory({required TransactionCategory transactionCategory, required String userId, required String subCategoryId}) async {
    await _transactionCategoryDataSource.createSubTransactionCategory(transactionCategory: transactionCategory, userId: userId, subCategoryId: subCategoryId);
  }

  @override
  Future<List<TransactionCategory>> getSubTransactionCategoryList({required String userId, required String categoryId}) async {
    final List<TransactionCategory> categories = await _transactionCategoryDataSource.getSubTransactionCategoryList(userId: userId, categoryId: categoryId);
    return categories;
  }

  @override
  Future<void> deleteSubTransactionCategory({required String categoryId, required String userId, required String subCategoryId}) {
    // TODO: implement deleteSubTransactionCategory
    throw UnimplementedError();
  }

  @override
  Future<void> updateSubTransactionCategory({required TransactionCategory transactionCategory, required String userId, required String subCategoryId}) {
    // TODO: implement updateSubTransactionCategory
    throw UnimplementedError();
  }
}
