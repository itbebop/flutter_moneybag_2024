import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/common/data/month_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends ConsumerWidget {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final Function(DateTime, DateTime) onDaySelected;
  const Calendar({
    super.key,
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<TransactionDetail>>(
      stream: ref.watch(transactionStateProvider.notifier).getTransactions().asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // 에러 발생 시 Snackbar로 메시지 표시
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('잠시 후에 다시 시도해주세요')),
            );
          });
          return const Center(child: Text('데이터가 없습니다.')); // 기본 상태로 변경
        } else if (snapshot.hasData) {
          final events = snapshot.data!;
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
              focusedDay: focusedDay,
              eventLoader: (day) {
                return events.where((event) => isSameDay(event.createdAt, day)).toList();
              },
              selectedDayPredicate: (day) => isSameDay(selectedDay, day),
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.horizontalSwipe,
              onDaySelected: onDaySelected,
              onPageChanged: (focusedDay) {
                ref.read(monthStateProvider.notifier).setMonth(MonthList.values[focusedDay.month - 1]); // 수정된 부분
              },
              calendarStyle: const CalendarStyle(
                markerDecoration: BoxDecoration(
                  color: UiConfig.primaryColorSurface,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: UiConfig.primaryColorSurface,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: UiConfig.buttonColor,
                  shape: BoxShape.circle,
                ),
                markersMaxCount: 3, // 한 날짜에 최대 3개의 마커 표시
                markersAlignment: Alignment.bottomCenter, // 마커 정렬
              ),
            ),
          );
        } else {
          // snapshot이 데이터도 없고 에러도 없는 경우 (기본적으로 빈 상태일 경우)
          return const Center(child: Text('데이터가 없습니다.'));
        }
      },
    );
  }
}
