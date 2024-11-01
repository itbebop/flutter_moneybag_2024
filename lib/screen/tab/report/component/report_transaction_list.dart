import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/widget/transaction_item.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportTransactionList extends ConsumerWidget {
  final int selectedMonth;
  final int? selectedDay;

  const ReportTransactionList({super.key, required this.selectedMonth, this.selectedDay});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<TransactionDetail>>(
      stream: ref.watch(reportScreenStateProvider.notifier).getTransactionList().asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('잠시 후에 다시 시도해주세요')),
            );
          });
          return const Center(child: Text('데이터가 없습니다.'));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator()); // 로딩 상태 처리 추가
        }
        final transactionList = snapshot.data!; // 데이터가 있을 때만 사용
        return ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: (context, index) {
            final transaction = transactionList[index];

            // 현재 연도, 선택한 월, 선택한 일 계산
            final now = DateTime.now();
            final selectedYear = now.year; // 선택한 연도 (필요시 동적으로 변경 가능)
            final firstDayOfSelectedMonth = DateTime(selectedYear, selectedMonth, 1);
            final lastDayOfSelectedMonth = DateTime(selectedYear, selectedMonth + 1, 1).subtract(const Duration(seconds: 1));

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
            final currentTransactionDate = standardFormat.format(transaction.createdAt);

            // 날짜가 중복되지 않도록 첫 거래인지 확인
            bool isFirstTransactionOfTheDay = index == 0 || standardFormat.format(transactionList[index - 1].createdAt) != currentTransactionDate;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isFirstTransactionOfTheDay) // 날짜가 중복되지 않도록 처리
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 24),
                        Text(
                          currentTransactionDate,
                          style: UiConfig.h4Style,
                        ), // 해당 날짜 출력
                      ],
                    ),
                  ),
                TransactionItem(
                  transaction: transaction,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        );
      },
    );
  }
}
