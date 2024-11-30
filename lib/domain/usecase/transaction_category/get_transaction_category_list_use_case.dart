import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';

class GetTransactionCategoryListUseCase {
  final TransactionCategoryRepository _transactionCategoryRepository;

  GetTransactionCategoryListUseCase({required TransactionCategoryRepository transactionCategoryRepository}) : _transactionCategoryRepository = transactionCategoryRepository;

  Future<List<TransactionCategory>> execute({required int userId}) async {
    return await _transactionCategoryRepository.getTransactionCategoryList(userId: userId);
  }
}
