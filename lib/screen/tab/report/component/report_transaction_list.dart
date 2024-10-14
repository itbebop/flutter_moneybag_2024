import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_item.dart';
import 'package:flutter_moneybag_2024/domain/model/dummies.dart';
import 'package:intl/intl.dart';

class ReportTransactionList extends StatelessWidget {
  final int selectedMonth;
  final int? selectedDay;

  const ReportTransactionList({super.key, required this.selectedMonth, this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactionList.length,
      itemBuilder: (context, index) {
        final transaction = transactionList[index];

        // 현재 연도, 선택한 월, 선택한 일 계산
        final now = DateTime.now();
        final selectedYear = now.year; // 선택한 연도 (필요시 동적으로 변경 가능)
        final firstDayOfSelectedMonth = DateTime(selectedYear, selectedMonth, 1);
        final lastDayOfSelectedMonth = DateTime(selectedYear, selectedMonth + 1, 0);

        // 선택한 day에 맞게 해당 날짜의 첫날과 마지막 날 설정
        DateTime startOfSelectedDay;
        DateTime endOfSelectedDay;

        if (selectedDay == null) {
          // 선택한 day가 없는 경우 월 전체 출력
          startOfSelectedDay = firstDayOfSelectedMonth;
          endOfSelectedDay = lastDayOfSelectedMonth;
        } else {
          // 선택한 day가 있는 경우 그 날짜에 맞게 범위를 설정
          startOfSelectedDay = DateTime(selectedYear, selectedMonth, selectedDay!);
          endOfSelectedDay = DateTime(selectedYear, selectedMonth, selectedDay!, 23, 59, 59);
        }

        // 선택된 월과 일에 해당하는 거래 내역만 필터링
        if (transaction.createdAt.isBefore(startOfSelectedDay) || transaction.createdAt.isAfter(endOfSelectedDay)) {
          return const SizedBox.shrink(); // 선택한 날짜의 범위가 아니면 출력하지 않음
        }

        // 날짜 포맷 설정
        final dateFormat = DateFormat('yyyy-MM-dd');
        final createdAtFormatted = dateFormat.format(transaction.createdAt);
        final currentTransactionDate = dateFormat.format(transaction.createdAt);

        // 날짜가 중복되지 않도록 첫 거래인지 확인
        bool isFirstTransactionOfTheDay = index == 0 || dateFormat.format(transactionList[index - 1].createdAt) != currentTransactionDate;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFirstTransactionOfTheDay) // 날짜가 중복되지 않도록 처리
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 24),
                    Text(currentTransactionDate), // 해당 날짜 출력
                  ],
                ),
              ),
            TransactionItem(
              title: transaction.title,
              amount: transaction.amount,
              imgUrl: transaction.imgUrl,
              createdAt: createdAtFormatted,
              category: transaction.category,
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
