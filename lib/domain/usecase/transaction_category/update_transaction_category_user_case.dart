import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class UpdateTransactionCategoryUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  UpdateTransactionCategoryUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<void> execute({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryRepository.updateTransactionCategory(transactionCategory: transactionCategory);
  }
}
