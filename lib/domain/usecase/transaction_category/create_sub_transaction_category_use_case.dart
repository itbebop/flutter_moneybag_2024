import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class CreateSubTransactionCategoryUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  CreateSubTransactionCategoryUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<void> execute({required TransactionCategory transactionCategory, required String userId, required String subCategoryId}) async {
    await _transactionCategoryRepository.createSubTransactionCategory(transactionCategory: transactionCategory, userId: userId, subCategoryId: subCategoryId);
  }
}
