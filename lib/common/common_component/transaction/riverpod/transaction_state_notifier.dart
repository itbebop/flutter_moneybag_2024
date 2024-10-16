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

  Future<List<TransactionDetail>> generateSampleTransactions() async {
    return await state.getTransactionListUseCase.execute();
  }

  Future<Map<DateTime, List<TransactionDetail>>> initializeTransactionEvents() async {
    // 수정 가능한 LinkedHashMap으로 설정
    final newTransactionEvents = LinkedHashMap<DateTime, List<TransactionDetail>>(
      equals: isSameDay,
      hashCode: (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
    );

    final transactions = await generateSampleTransactions();
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

  Future<List<TransactionDetail>> getEventsForDay(DateTime day) async {
    final events = await initializeTransactionEvents();
    return events[day] ?? [];
  }
}
