import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/sort_button.dart';
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
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFFFFF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(transaction1.imgUrl),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(transaction1.title, style: UiConfig.h4Style),
                                  Text(transaction1.createdAt.toString(),
                                      style: UiConfig.smallStyle.copyWith(
                                        color: UiConfig.color[700],
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Text(transaction1.amount.toString())
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
