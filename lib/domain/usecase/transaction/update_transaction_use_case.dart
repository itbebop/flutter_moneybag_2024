import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class UpdateTransactionUseCase {
  final TransactionRepository _transactionRepository;

  UpdateTransactionUseCase({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;

  Future<void> execute({required TransactionDetail transaction}) async {
    await _transactionRepository.updateTransaction(transaction: transaction);
  }
}