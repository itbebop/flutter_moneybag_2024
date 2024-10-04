import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class MonthDropdownButton extends StatelessWidget {
  final MonthList selectedMonth;
  final ValueChanged<MonthList> onMonthChanged;

  MonthDropdownButton({
    super.key,
    required this.selectedMonth,
    required this.onMonthChanged,
  });
  final currentTabProvider = StateProvider<MonthList>((ref) => MonthList.jan);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<MonthList>(
      value: selectedMonth,
      items: MonthList.values
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e.kr,
                  style: const TextStyle(fontSize: 32),
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
