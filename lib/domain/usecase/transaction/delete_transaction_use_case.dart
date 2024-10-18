import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class DeleteTransactionUseCase {
  final TransactionRepository _transactionRepository;

  DeleteTransactionUseCase({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;

  Future<void> execute({required String transactionId, required String userId, required String assetId}) async {
    await _transactionRepository.deleteTransaction(transactionId: transactionId, userId: userId, assetId: assetId);
  }
}
