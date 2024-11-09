import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

import '../../../../common/common.dart';

class LineChartWeekly extends StatefulWidget {
  final Period period;
  final AssetType assetType;
  final List<TransactionDetail> transactionList;

  const LineChartWeekly({
    super.key,
    required this.period,
    required this.assetType,
    required this.transactionList,
  });

  @override
  LineChartWeeklyState createState() => LineChartWeeklyState();
}

class LineChartWeeklyState extends State<LineChartWeekly> {
  List<TransactionDetail> filterTransactionsByPeriod(List<TransactionDetail> transactions) {
    final now = DateTime.now();
    return transactions.where((transaction) {
      final date = transaction.createdAt;
      switch (widget.period) {
        case Period.year:
          return date.year == now.year;
        case Period.month:
          return date.year == now.year && date.month == now.month;
        case Period.week:
          final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday as start of week
          final endOfWeek = startOfWeek.add(const Duration(days: 6)); // Sunday as end of week
          return date.isAfter(startOfWeek.subtract(const Duration(seconds: 1))) && date.isBefore(endOfWeek.add(const Duration(days: 1)));
        default:
          return date.year == now.year;
      }
    }).toList();
  }

  Map<String, Map<int, double>> weeklySum(List<TransactionDetail> transactionList) {
    Map<int, double> totalSums = {};
    Map<int, double> incomeSums = {};
    Map<int, double> expenseSums = {};

    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // 월요일 기준 시작일

    for (var transaction in transactionList) {
      int dayOfWeek = transaction.createdAt.difference(startOfWeek).inDays;

      // 현재 주에 해당하는 거래만 포함
      if (dayOfWeek >= 0 && dayOfWeek < 7) {
        double amount = transaction.amount;

        // 총합 (양수/음수 상관없이 모두 포함)
        totalSums[dayOfWeek] = (totalSums[dayOfWeek] ?? 0) + amount;

        // 수입: 양수 값만 포함
        if (amount > 0) {
          incomeSums[dayOfWeek] = (incomeSums[dayOfWeek] ?? 0) + amount;
        }
        // 지출: 음수 값의 절대값만 포함
        else {
          expenseSums[dayOfWeek] = (expenseSums[dayOfWeek] ?? 0) + amount.abs();
        }
      }
    }

    return {
      'total': totalSums,
      'income': incomeSums,
      'expense': expenseSums,
    };
  }

  List<FlSpot> createWeeklyTotalSpots(List<TransactionDetail> dataList) {
    final sums = weeklySum(dataList)['total']!;
    return List.generate(7, (index) {
      return FlSpot(index.toDouble(), (sums[index] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  List<FlSpot> createWeeklyIncomeSpots(List<TransactionDetail> dataList) {
    final sums = weeklySum(dataList)['income']!;
    return List.generate(7, (index) {
      return FlSpot(index.toDouble(), (sums[index] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  List<FlSpot> createWeeklyExpenseSpots(List<TransactionDetail> dataList) {
    final sums = weeklySum(dataList)['expense']!;
    return List.generate(7, (index) {
      return FlSpot(index.toDouble(), (sums[index] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  LineChartData weeklyData(dataList) {
    return LineChartData(
      lineBarsData: [
        if (widget.assetType == AssetType.total)
          LineChartBarData(
            spots: createWeeklyTotalSpots(dataList),
            isCurved: false,
            color: UiConfig.greyColor,
            belowBarData: BarAreaData(
              show: true,
              color: UiConfig.greyColor.withOpacity(.1),
            ),
          ),
        if (widget.assetType == AssetType.income)
          LineChartBarData(
            spots: createWeeklyIncomeSpots(dataList),
            isCurved: false,
            color: UiConfig.primaryColorSurface, // 수입 라인 색상
            belowBarData: BarAreaData(
              show: true,
              color: UiConfig.buttonColor.withOpacity(.2),
            ),
          ),
        if (widget.assetType == AssetType.expense)
          LineChartBarData(
            spots: createWeeklyExpenseSpots(dataList),
            isCurved: false,
            color: UiConfig.secondaryTextColor, // 지출 라인 색상

            belowBarData: BarAreaData(
              show: true,
              color: UiConfig.secondaryTextColor.withOpacity(.2),
            ),
          ),
      ],
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 42,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            getTitlesWidget: (value, meta) {
              final dayLabels = ["월", "화", "수", "목", "금", "토", "일"];
              return Text(dayLabels[value.toInt()], style: const TextStyle(color: Colors.black, fontSize: 15));
            },
            interval: 1,
          ),
        ),
      ),
      gridData: const FlGridData(show: true),
      borderData: FlBorderData(
        show: false,
        // border: Border.all(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LineChart(weeklyData(widget.transactionList)),
        ),
      ],
    );
  }
}
