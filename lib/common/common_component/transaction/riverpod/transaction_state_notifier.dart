import 'dart:collection';

import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final transactionStateProvider = StateNotifierProvider<TransactionStateNotifier, TransactionState>((ref) => TransactionStateNotifier(TransactionState(
      createTransactionUseCase: getIt(),
      deleteTransactionUseCase: getIt(),
      getTransactionListUseCase: getIt(),
      updateTransactionUseCase: getIt(),
    )));

class TransactionStateNotifier extends StateNotifier<TransactionState> {
  TransactionStateNotifier(super.state);

  Future<void> createTransaction(TransactionDetail transactionDetail) async {
    await state.createTransactionUseCase.execute(transactionDetail: transactionDetail);
  }

  Future<List<TransactionDetail>> getTransactions() async {
    return await state.getTransactionListUseCase.execute();
  }

  // 트랜잭션 이벤트를 초기화
  Future<Map<DateTime, List<TransactionDetail>>> initializeTransactionEvents() async {
    final newTransactionEvents = LinkedHashMap<DateTime, List<TransactionDetail>>(
      equals: isSameDay,
      hashCode: (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
    );

    final transactions = await getTransactions();
    for (var transaction in transactions) {
      final date = DateTime(transaction.createdAt!.year, transaction.createdAt!.month, transaction.createdAt!.day);
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
    return events[day] ?? [];
  }
}
