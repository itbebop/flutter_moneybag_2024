import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthDropdownButton extends StatelessWidget {
  final MonthList selectedMonth;
  final ValueChanged<MonthList> onMonthChanged;
  final double fontSize;
  MonthDropdownButton({
    super.key,
    required this.selectedMonth,
    required this.onMonthChanged,
    this.fontSize = 16,
  });
  final currentTabProvider = StateProvider<MonthList>((ref) => MonthList.jan);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<MonthList>(
      value: selectedMonth,
      itemHeight: 48.0,
      items: MonthList.values
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e.kr,
                  style: TextStyle(fontSize: fontSize),
                ),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onMonthChanged(value);
        }
      },
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 42,
      underline: const SizedBox(),
      dropdownColor: UiConfig.backgroundColor,
    );
  }
}
