import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/month_dropdown_button.dart';
import 'package:flutter_moneybag_2024/common/common_component/sort_button.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_list.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_items.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<HomeScreen> {
  String currentMonth = DateFormat('MMM').format(DateTime.now()).toLowerCase();
  MonthList selectedMonth = MonthList.jan; // 초기값으로 설정

  @override
  void initState() {
    super.initState();
    // 현재 월에 해당하는 MonthList 항목으로 selectedMonth 초기화
    selectedMonth = MonthList.values.firstWhere(
      (e) => e.toString().split('.')[1] == currentMonth,
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime focusedDay = DateTime.utc(now.year, selectedMonth.month, now.day);

    return Scaffold(
      body: SingleChildScrollView(
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
                          fontSize: 24,
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
                      ),
                    ],
                  ),
                  const AssetList(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TableCalendar(
              // headerVisible: false,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              locale: 'ko-KR',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: focusedDay,
              availableGestures: AvailableGestures.horizontalSwipe,
              onHeaderTapped: (focusedDay) async {
                // 1. show date picker
                final DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: now,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );
                if (dateTime != null) {
                  setState(() {
                    now = dateTime;
                  });
                }
                // 2. update the focusedDay state with the selected date (from date picker)
              },
            ),
            const Divider(),
            const SortButton(),
            const TransactionList(),
          ],
        ),
      ),
    );
  }
}
