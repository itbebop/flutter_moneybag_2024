import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/sort_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/component/report_transaction_list.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ReportListFragment extends ConsumerStatefulWidget {
  const ReportListFragment({super.key});
  @override
  ConsumerState<ReportListFragment> createState() => _ReportListFragmentState();
}

class _ReportListFragmentState extends ConsumerState<ReportListFragment> {
  DateTime now = DateTime.now();
  MonthList selectedMonth = MonthList.jan;
  String currentMonth = DateFormat('MMM').format(DateTime.now()).toLowerCase();

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
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MonthDropdownButton(
              selectedMonth: selectedMonth,
              onMonthChanged: (value) {
                setState(() {
                  selectedMonth = value;
                });
              },
            ),
            const SortButton(),
          ],
        ),
      ),
      SizedBox(
          height: 520.0.h,
          child: ReportTransactionList(
            selectedMonth: selectedMonth.month,
          )),
    ]);
  }
}
