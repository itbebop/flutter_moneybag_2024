import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

abstract interface class TransactionCategoryRepository {
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory});
  Future<List<TransactionCategory>> getTransactionCategoryList();
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory});
  Future<void> deleteTransactionCategory({required String id});
}
