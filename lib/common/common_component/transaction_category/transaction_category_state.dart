import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/create_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/delete_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/get_transaction_category_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/update_transaction_category_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category_state.freezed.dart';

@freezed
class TransactionCategoryState with _$TransactionCategoryState {
  const factory TransactionCategoryState({
    @Default(false) final bool isLoading,
    required final String userId,
    required final CreateTransactionCategoryUseCase createTransactionCategoryUseCase,
    required final DeleteTransactionCategoryUseCase deleteTransactionCategoryUseCase,
    required final GetTransactionCategoryListUseCase getTransactionCategoryListUseCase,
    required final UpdateTransactionCategoryUseCase updateTransactionCategoryUseCase,
  }) = _TransactionCategoryState;
}
