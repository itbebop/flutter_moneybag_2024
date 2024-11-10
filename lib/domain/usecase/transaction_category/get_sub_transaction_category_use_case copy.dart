import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class GetSubTransactionCategoryUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  GetSubTransactionCategoryUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<List<TransactionCategory>> execute({required String userId, required String categoryId}) async {
    return await _transactionCategoryRepository.getSubTransactionCategoryList(userId: userId, categoryId: categoryId);
  }
}
