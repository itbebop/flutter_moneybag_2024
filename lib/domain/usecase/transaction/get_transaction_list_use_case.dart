import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';

class GetTransactionListUseCase {
  final TransactionRepository _transactionRepository;

  GetTransactionListUseCase({required TransactionRepository transactionRepository}) : _transactionRepository = transactionRepository;

  Future<List<TransactionDetail>> execute(List<String> assetIdList) async {
    return await _transactionRepository.getTransactionList(assetIdList: assetIdList);
  }
}
