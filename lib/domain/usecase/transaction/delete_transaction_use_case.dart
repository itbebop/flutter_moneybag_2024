import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class DeleteTransactionUseCase {
  final TransactionRepository _transactionRepository;

  DeleteTransactionUseCase({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;

  Future<void> execute({required int transactionId, required int assetId, required int userId}) async {
    await _transactionRepository.deleteTransaction(transactionId: transactionId, assetId: assetId, userId: userId);
  }
}
