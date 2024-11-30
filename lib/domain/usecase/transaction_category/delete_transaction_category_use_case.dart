import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class DeleteTransactionCategoryUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  DeleteTransactionCategoryUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<void> execute({required int categoryId}) async {
    await _transactionCategoryRepository.deleteTransactionCategory(categoryId: categoryId);
  }
}
