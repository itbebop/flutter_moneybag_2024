import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class CreateTransactionUseCase {
  final TransactionRepository _transactionRepository;

  CreateTransactionUseCase({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;

  Future<void> execute({required TransactionDetail transactionDetail, required String email, required String assetId}) async {
    await _transactionRepository.createTransaction(transaction: transactionDetail, email: email, assetId: assetId);
  }
}
