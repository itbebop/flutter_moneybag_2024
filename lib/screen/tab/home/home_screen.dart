import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_item.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/common/data/transaction_event.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String _currentMonth = DateFormat('MMM').format(DateTime.now()).toLowerCase();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  MonthList selectedMonth = MonthList.jan; // 초기값으로 설정
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final ValueNotifier<List<TransactionDetail>> _selectedEvents = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents.value = _getEventsForDay(_selectedDay!);
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

  List<TransactionDetail> _getEventsForDay(DateTime day) {
    return kTransactionEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });

    _selectedEvents.value = _getEventsForDay(selectedDay);
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(DateTime.now().year).toString().substring(2)}년',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
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
                  TableCalendar<TransactionDetail>(
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    locale: 'ko-KR',
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    calendarFormat: _calendarFormat,
                    availableGestures: AvailableGestures.horizontalSwipe,
                    onDaySelected: _onDaySelected,
                    eventLoader: _getEventsForDay,
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Divider(),
                  ValueListenableBuilder<List<TransactionDetail>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        shrinkWrap: true, // ListView의 크기를 제한
                        physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final transaction = value[index];
                          // return ListTile(
                          //   title: Text(transaction.title),
                          //   subtitle: Text('Amount: ${transaction.amount}'),
                          //   leading: Image.network(transaction.imgUrl),
                          // );
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Column(
                              children: [
                                TransactionItem(
                                  title: transaction.title,
                                  amount: transaction.amount,
                                  imgUrl: transaction.imgUrl,
                                  createdAt: transaction.createdAt.toString(),
                                  category: transaction.category,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
