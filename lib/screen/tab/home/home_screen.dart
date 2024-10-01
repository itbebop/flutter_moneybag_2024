import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/sort_button.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_item.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_list.dart';
import 'package:flutter_moneybag_2024/domain/model/dummies.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Text(
                        '${(DateTime.now().year).toString().substring(2)}년',
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        '${(DateTime.now().month).toString()}월',
                        style: const TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      AssetItems(title: '수입', amounts: 3400000),
                      const SizedBox(height: 16),
                      AssetItems(title: '지출', amounts: 1800000),
                      const SizedBox(height: 16),
                      AssetItems(title: '잔액', amounts: 1600000),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TableCalendar(
              firstDay: DateTime.utc(2021, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              //availableCalendarFormats: const {CalendarFormat.twoWeeks: '4 week'},
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
