import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class LineChartBase extends StatelessWidget {
  final Period period;
  final double maxY;
  final List<TransactionDetail> transactionList;

  const LineChartBase({
    super.key,
    required this.period,
    required this.maxY,
    required this.transactionList,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(yearlyData(transactionList, maxY));
  }

  List<TransactionDetail> filterTransactionsByPeriod(List<TransactionDetail> transactions) {
    final now = DateTime.now();
    return transactions.where((transaction) {
      final date = transaction.createdAt;
      switch (period) {
        case Period.year:
          // 현재 연도에 해당하는 거래만 필터링
          return date.year == now.year;
        case Period.month:
          // 현재 연도와 월이 같은 거래만 필터링
          return date.year == now.year && date.month == now.month;
        case Period.week:
          // 이번 주 (월요일~일요일)에 해당하는 거래만 필터링
          final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday as start of week
          final endOfWeek = startOfWeek.add(const Duration(days: 6)); // Sunday as end of week
          return date.isAfter(startOfWeek.subtract(const Duration(seconds: 1))) && date.isBefore(endOfWeek.add(const Duration(days: 1)));
        default:
          // 기본값으로 연도 단위 필터링 (Yearly)
          return date.year == now.year;
      }
    }).toList();
  }

// 월별 데이터 그룹화 후 amount 합산
  Map<int, double> monthlySum(List<TransactionDetail> transactionList) {
    Map<int, double> monthlySums = {};
    for (var transaction in transactionList) {
      int month = transaction.createdAt.month;
      monthlySums[month] = (monthlySums[month] ?? 0) + transaction.amount;
    }
    return monthlySums;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
    String text;

    switch (value.toInt()) {
      case 1:
        text = '0';
        break;

      case 2:
        text = '만';
        break;
      case 3:
        text = '10만';
        break;
      case 4:
        text = '100만';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  List<FlSpot> createYearlySpots(List<TransactionDetail> dataList, double maxPoints) {
    final sums = monthlySum(dataList);
    return List.generate(12, (index) {
      final month = index + 1;
      return FlSpot(month.toDouble(), sums[month] ?? 0);
    });
  }

  LineChartData yearlyData(dataList, maxPoints) {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          spots: createYearlySpots(dataList, maxPoints),
          isCurved: true,
          // colors: [Colors.blue],
          belowBarData: BarAreaData(show: true),
        ),
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            getTitlesWidget: (value, meta) {
              final monthLabels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
              return Text(monthLabels[value.toInt() - 1], style: const TextStyle(color: Colors.black, fontSize: 10));
            },
          ),
        ),
      ),
      gridData: const FlGridData(show: true),
      borderData: FlBorderData(show: true, border: Border.all(color: Colors.black)),
    );
  }
}
