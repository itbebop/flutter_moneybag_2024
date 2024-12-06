import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

abstract interface class TransactionCategoryDataSource {
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory});
  Future<List<TransactionCategory>> getTransactionCategoryList({required int userId});
  Future<TransactionCategory> getTransactionCategory({required int categoryId});
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory});
  Future<void> deleteTransactionCategory({required int categoryId});
}
