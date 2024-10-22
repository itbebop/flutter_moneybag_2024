import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_list.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/calendar.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/current_month.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/home_transaction_list.dart';
import 'package:flutter_moneybag_2024/common/data/month_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // build하면서 오늘 transaction을 불러옴
    ref.read(transactionStateProvider.notifier).fetchEventsForDay(DateTime.now());
    Future.microtask(() {
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
                                    monthProvider.setMonth(value);
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
                    Calendar(
                      selectedDay: ref.watch(transactionStateProvider).selectedDay,
                      focusedDay: ref.watch(transactionStateProvider).focusedDay,
                      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                        // setState(() {
                        //   _selectedDay = selectedDay;
                        //   _focusedDay = focusedDay;
                        //   monthProvider.setMonth(MonthList.values[focusedDay.month - 1]); // 선택한 날짜의 월로 업데이트
                        // });
                        ref.read(transactionStateProvider.notifier).onSelectDay(selectedDay, focusedDay);
                        // _fetchEventsForDay(selectedDay);
                        ref.read(transactionStateProvider.notifier).fetchEventsForDay(selectedDay);
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Divider(),
                    ValueListenableBuilder<List<TransactionDetail>>(
                      valueListenable: transactionProvider.selectedEvents,
                      builder: (context, events, child) {
                        if (events.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Center(child: Text('등록된 내역이 없습니다.')),
                          );
                        }
                        return HomeTransactionList(selectedEvents: transactionProvider.selectedEvents);
                      },
                    ),
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
