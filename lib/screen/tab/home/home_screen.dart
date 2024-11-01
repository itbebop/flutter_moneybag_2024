import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_list.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/calendar.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/current_month.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/home_transaction_list.dart';
import 'package:flutter_moneybag_2024/common/data/month_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(transactionStateProvider.notifier).getTransactions();
      // build하면서 오늘 transaction을 불러옴
      // 자동으로 현재 달을 설정
      final currentMonth = DateFormat('MMM').format(DateTime.now()).toLowerCase();
      final initialMonth = MonthList.values.firstWhere(
        (e) => e.toString().split('.')[1] == currentMonth,
      );
      ref.read(monthStateProvider.notifier).setMonth(initialMonth);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider);
    final selectedMonth = ref.watch(monthStateProvider);
    final monthProvider = ref.read(monthStateProvider.notifier);
    final transactionProvider = ref.read(transactionStateProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: UiConfig.whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CurrentMonth(),
                                MonthDropdownButton(
                                  selectedMonth: selectedMonth,
                                  onMonthChanged: (value) {
                                    final focusedDay = ref.read(monthStateProvider.notifier).setMonth(value);
                                    monthProvider.setMonth(value);
                                    ref.watch(transactionStateProvider.notifier).onSelectDay(focusedDay, focusedDay);
                                  },
                                  fontSize: 24,
                                ),
                              ],
                            ),
                          ),
                          const AssetList(),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    StreamBuilder<List<TransactionDetail>>(
                        stream: ref.watch(transactionStateProvider.notifier).getTransactions().asStream(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('잠시 후에 다시 시도해주세요')),
                              );
                            });
                            return const Center(child: Text('데이터가 없습니다.'));
                          }
                          if (!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator()); // 로딩 상태 처리 추가
                          }
                          final transactionList = snapshot.data!;
                          return Column(
                            children: [
                              Calendar(
                                selectedDay: ref.watch(transactionStateProvider).selectedDay,
                                focusedDay: ref.watch(transactionStateProvider).focusedDay,
                                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                                  ref.watch(transactionStateProvider.notifier).onSelectDay(selectedDay, focusedDay);
                                },
                              ),
                              const SizedBox(height: 8.0),
                              const Divider(),
                              ValueListenableBuilder<List<TransactionDetail>>(
                                valueListenable: ValueNotifier<List<TransactionDetail>>(
                                  getEventsForDay(transactionProvider.selectedDay, transactionList),
                                ),
                                builder: (context, events, child) {
                                  if (userState.user != null) {
                                    return events.isEmpty
                                        ? const Padding(
                                            padding: EdgeInsets.only(top: 16.0),
                                            child: Center(child: Text('등록된 내역이 없습니다.')),
                                          )
                                        : HomeTransactionList(
                                            selectedEvents: ValueNotifier(events),
                                          );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            const Text('로그인 후 이용하실 수 있습니다.'),
                                            SizedBox(height: 16.h),
                                            TextButton(
                                              onPressed: () => context.push('/login'),
                                              child: const Text('> 로그인 페이지로 이동하기'),
                                            ),
                                            SizedBox(height: 32.h),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Map<DateTime, List<TransactionDetail>> initializeTransactionEvents(List<TransactionDetail> transactions) {
  final newTransactionEvents = LinkedHashMap<DateTime, List<TransactionDetail>>(
    equals: isSameDay,
    hashCode: (DateTime key) => key.day * 1000000 + key.month * 10000 + key.year,
  );

  // final transactions = await getTransactions();
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

List<TransactionDetail> getEventsForDay(DateTime day, List<TransactionDetail> transactions) {
  // 선택한 날짜의 이벤트를 가져옴
  final events = initializeTransactionEvents(transactions);

  return events[day] ?? [];
}
