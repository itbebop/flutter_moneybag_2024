import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final transactionStateProvider = StateNotifierProvider<TransactionStateNotifier, TransactionState>((ref) {
  return TransactionStateNotifier(
    TransactionState(
      createTransactionUseCase: getIt(),
      deleteTransactionUseCase: getIt(),
      getTransactionListUseCase: getIt(),
      updateTransactionUseCase: getIt(),
      assetId: '',
      assetIdList: [],
      amount: 0,
      assetType: AssetType.expense,
      selectedEvents: ValueNotifier([]),
      focusedDay: DateTime.now(),
      selectedDay: DateTime.now(),
    ),
  );
});

class TransactionStateNotifier extends StateNotifier<TransactionState> {
  TransactionStateNotifier(super.state);

  void selectAssetType(AssetType assetType) {
    state = state.copyWith(assetType: assetType);
    if (assetType == AssetType.income) {
      state = state.copyWith(isIncome: true);
    }
  }

  void selectAsset(String assetId) {
    state = state.copyWith(assetId: assetId);
  }

  void setAssetId(String assetId) {
    state = state.copyWith(assetId: assetId);
  }

  void onChangeAmount(String value) {
    final double amount = double.parse(value);
    if (state.assetType == AssetType.income) {
      state = state.copyWith(amount: amount);
    } else {
      state = state.copyWith(amount: -amount);
    }
  }

  void onSelectDay(DateTime selectedDay, DateTime focusedDay) {
    state = state.copyWith(selectedDay: selectedDay, focusedDay: focusedDay);
  }

  Future<void> createTransaction({required TransactionDetail transactionDetail, required String assetId}) async {
    await state.createTransactionUseCase.execute(transactionDetail: transactionDetail, assetId: assetId);
  }

  Future<void> getAssetIdList(List<String> assetIdList) async {
    state = state.copyWith(assetIdList: assetIdList);
  }

  Future<List<TransactionDetail>> getTransactions() async {
    return await state.getTransactionListUseCase.execute(state.assetIdList);
  }

  // 트랜잭션 이벤트를 초기화
  Future<Map<DateTime, List<TransactionDetail>>> initializeTransactionEvents() async {
    final newTransactionEvents = LinkedHashMap<DateTime, List<TransactionDetail>>(
      equals: isSameDay,
      hashCode: (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
    );

    final transactions = await getTransactions();
    for (var transaction in transactions) {
      final date = DateTime(transaction.createdAt.year, transaction.createdAt.month, transaction.createdAt.day);
      newTransactionEvents.update(
        date,
        (list) => list..add(transaction),
        ifAbsent: () => [transaction],
      );
    }
    return newTransactionEvents;
  }

  // 선택한 날짜의 이벤트를 가져옴
  Future<List<TransactionDetail>> getEventsForDay(DateTime day) async {
    final events = await initializeTransactionEvents();
    // print('day: $day');
    return events[day] ?? [];
  }

  Future<void> fetchEventsForDay(DateTime day) async {
    state = state.copyWith(events: await getEventsForDay(day));

    state = state.copyWith(selectedEvents: ValueNotifier(state.events));
    print('###events: $state.events');
  }

  void clearTransactions() {
    state = state.copyWith(
      selectedEvents: ValueNotifier([]),
      assetIdList: [],
    ); // 초기 상태로 리셋
  }
}
