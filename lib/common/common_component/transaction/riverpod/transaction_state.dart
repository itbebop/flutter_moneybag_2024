import 'package:flutter_moneybag_2024/domain/usecase/transaction/create_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/delete_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/get_transaction_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/update_transaction_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    @Default(false) final bool isLoading,
    required final CreateTransactionUseCase createTransactionUseCase,
    required final DeleteTransactionUseCase deleteTransactionUseCase,
    required final GetTransactionListUseCase getTransactionListUseCase,
    required final UpdateTransactionUseCase updateTransactionUseCase,
  }) = _TransactionState;
}