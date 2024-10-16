import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_list.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/calendar.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/current_month.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/home_transaction_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String _currentMonth = DateFormat('MMM').format(DateTime.now()).toLowerCase();
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;
  MonthList selectedMonth = MonthList.jan; // 초기값으로 설정
  final ValueNotifier<List<TransactionDetail>> _selectedEvents = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    Future.microtask(() {
      _fetchEventsForDay(_selectedDay);

      selectedMonth = MonthList.values.firstWhere(
        (e) => e.toString().split('.')[1] == _currentMonth,
      );
    });
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  Future<void> _fetchEventsForDay(DateTime day) async {
    final events = await ref.read(transactionStateProvider.notifier).getEventsForDay(day);
    setState(() {
      _selectedEvents.value = events;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CurrentMonth(),
                              MonthDropdownButton(
                                selectedMonth: selectedMonth,
                                onMonthChanged: (value) {
                                  setState(() {
                                    selectedMonth = value; // 선택된 월 업데이트
                                  });
                                },
                                fontSize: 24,
                              ),
                            ],
                          ),
                          const AssetList(),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Calendar(
                      selectedDay: _selectedDay,
                      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                        _fetchEventsForDay(selectedDay); // Fetch events for the new selected day
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Divider(),
                    ValueListenableBuilder<List<TransactionDetail>>(
                      valueListenable: _selectedEvents,
                      builder: (context, events, child) {
                        if (events.isEmpty) {
                          return const Center(child: Text('No events found.'));
                        }
                        return HomeTransactionList(selectedEvents: _selectedEvents);
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
