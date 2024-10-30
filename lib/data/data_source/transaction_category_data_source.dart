import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

abstract interface class TransactionCategoryDataSource {
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory, required String userId});
  Future<List<TransactionCategory>> getTransactionCategoryList({required String userId});
  Future<void> deleteTransactionCategory({required String categoryId, required String userId});
}
