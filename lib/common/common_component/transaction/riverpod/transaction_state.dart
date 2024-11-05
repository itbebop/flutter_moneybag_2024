import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
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
    @Default([]) List<TransactionDetail> activatedTransactionList,
    required String userId,
    required final DateTime selectedDay,
    required final DateTime focusedDay,
    required ValueNotifier<List<TransactionDetail>> selectedEvents,
    required final String assetId,
    required final AssetType assetType,
    required final List<String> assetIdList,
    required final List<String> activatedAssetIdList,
    required final CreateTransactionUseCase createTransactionUseCase,
    required final DeleteTransactionUseCase deleteTransactionUseCase,
    required final GetTransactionListUseCase getTransactionListUseCase,
    required final UpdateTransactionUseCase updateTransactionUseCase,
  }) = _TransactionState;
}
