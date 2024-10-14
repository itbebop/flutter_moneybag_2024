import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/transaction_event.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const Calendar({super.key, required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: UiConfig.whiteColor,
      ),
      child: TableCalendar<TransactionDetail>(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        locale: 'ko-KR',
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: now,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        calendarFormat: CalendarFormat.month,
        availableGestures: AvailableGestures.horizontalSwipe,
        onDaySelected: onDaySelected,
        eventLoader: getEventsForDay,
        onPageChanged: (focusedDay) {
          focusedDay = now;
        },
      ),
    );
  }
}
