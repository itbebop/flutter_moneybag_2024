import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

abstract interface class TransactionCategoryRepository {
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory});
  Future<List<TransactionCategory>> getTransactionCategoryList({required int userId, required int level, int? parentCategoryId});
  Future<TransactionCategory> getTransactionCategory({required int categoryId});
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory});
  Future<void> deleteTransactionCategory({required int categoryId});
}
