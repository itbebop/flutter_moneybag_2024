import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class GetTransactionCategoryUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  GetTransactionCategoryUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<List<TransactionCategory>> execute({required String userId}) async {
    return await _transactionCategoryRepository.getTransactionCategoryList(userId: userId);
  }
}
