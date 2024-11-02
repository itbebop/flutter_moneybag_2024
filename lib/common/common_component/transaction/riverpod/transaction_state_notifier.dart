import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionStateProvider = StateNotifierProvider<TransactionStateNotifier, TransactionState>((ref) {
  final assetState = ref.watch(assetStateProvier);
  final List<String> assetIdList = assetState.assetIdList;
  final assetType = assetState.assetType;

  return TransactionStateNotifier(
    TransactionState(
      createTransactionUseCase: getIt(),
      deleteTransactionUseCase: getIt(),
      getTransactionListUseCase: getIt(),
      updateTransactionUseCase: getIt(),
      assetId: '',
      assetIdList: assetIdList,
      assetType: assetType,
      selectedEvents: ValueNotifier([]),
      focusedDay: DateTime.now(),
      selectedDay: DateTime.now(),
    ),
  );
});

class TransactionStateNotifier extends StateNotifier<TransactionState> {
  TransactionStateNotifier(super.state);

  void selectAsset(String assetId) {
    state = state.copyWith(assetId: assetId);
  }

  void setAssetId(String assetId) {
    state = state.copyWith(assetId: assetId);
  }

  double onChangeAmount(String value) {
    double amount = double.parse(value);
    if (state.assetType == AssetType.expense) {
      amount = -amount;
    }
    return amount;
  }

  void onSelectDay(DateTime selectedDay, DateTime focusedDay) {
    state = state.copyWith(selectedDay: selectedDay, focusedDay: focusedDay);
  }

  Future<void> createTransaction({required String memo, required String amount, required DateTime createAt, required TransactionCategory category, required String assetId, userId}) async {
    final transactionDetail = TransactionDetail(
      transactionId: '1',
      memo: memo,
      createdAt: createAt,
      updatedAt: createAt,
      amount: onChangeAmount(amount),
      userId: userId,
      imgUrl: '',
      category: category,
    );
    await state.createTransactionUseCase.execute(transactionDetail: transactionDetail, assetId: assetId);
  }

  Future<List<TransactionDetail>> getTransactions() async {
    return await state.getTransactionListUseCase.execute(state.assetIdList);
  }

  void clearTransactions() {
    state = state.copyWith(
      selectedEvents: ValueNotifier([]),
      assetIdList: [],
    ); // 초기 상태로 리셋
  }
}
