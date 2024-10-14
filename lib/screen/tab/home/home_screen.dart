import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/common/data/transaction_event.dart';
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
    _selectedEvents.value = getEventsForDay(_selectedDay);
    // 현재 월에 해당하는 MonthList 항목으로 selectedMonth 초기화
    selectedMonth = MonthList.values.firstWhere(
      (e) => e.toString().split('.')[1] == _currentMonth,
    );
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // DateTime focusedDay = DateTime.utc(now.year, selectedMonth.month, now.day);
    // final int selectedDay = focusedDay.day;

    return Scaffold(
      body: Column(
        // Column으로 변경
        children: [
          Expanded(
            // Expanded를 Column 안으로 이동
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: UiConfig.whiteColor),
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
                                  fontSize: 24),
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
                        _selectedEvents.value = getEventsForDay(selectedDay);
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Divider(),
                    HomeTransactionList(selectedEvents: _selectedEvents),
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
