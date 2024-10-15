import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class CreateTransactionCategoryUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  CreateTransactionCategoryUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<void> execute({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryRepository.createTransactionCategory(transactionCategory: transactionCategory);
  }
}
