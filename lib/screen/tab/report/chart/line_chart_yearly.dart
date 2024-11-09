import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

import '../../../../common/common.dart';

class LineChartYearly extends StatefulWidget {
  final Period period;
  final AssetType assetType;
  final List<TransactionDetail> transactionList;

  const LineChartYearly({
    super.key,
    required this.period,
    required this.assetType,
    required this.transactionList,
  });

  @override
  LineChartYearlyState createState() => LineChartYearlyState();
}

class LineChartYearlyState extends State<LineChartYearly> {
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

  Map<String, Map<int, double>> monthlySum(List<TransactionDetail> transactionList) {
    Map<int, double> totalSums = {};
    Map<int, double> incomeSums = {};
    Map<int, double> expenseSums = {};

    for (var transaction in transactionList) {
      int month = transaction.createdAt.month;
      double amount = transaction.amount;

      // 총합 (양수/음수 상관없이 모두 포함)
      totalSums[month] = (totalSums[month] ?? 0) + amount;

      // 수입: 양수 값만 포함
      if (amount > 0) {
        incomeSums[month] = (incomeSums[month] ?? 0) + amount;
      }
      // 지출: 음수 값의 절대값만 포함
      else {
        expenseSums[month] = (expenseSums[month] ?? 0) + amount.abs();
      }
    }

    return {
      'total': totalSums,
      'income': incomeSums,
      'expense': expenseSums,
    };
  }

  List<FlSpot> createYearlyTotalSpots(List<TransactionDetail> dataList) {
    final sums = monthlySum(dataList)['total']!;
    return List.generate(12, (index) {
      final month = index + 1;
      return FlSpot(month.toDouble(), (sums[month] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  List<FlSpot> createYearlyIncomeSpots(List<TransactionDetail> dataList) {
    final sums = monthlySum(dataList)['income']!;
    return List.generate(12, (index) {
      final month = index + 1;
      return FlSpot(month.toDouble(), (sums[month] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  List<FlSpot> createYearlyExpenseSpots(List<TransactionDetail> dataList) {
    final sums = monthlySum(dataList)['expense']!;
    return List.generate(12, (index) {
      final month = index + 1;
      return FlSpot(month.toDouble(), (sums[month] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  LineChartData yearlyData(dataList) {
    return LineChartData(
      lineBarsData: [
        if (widget.assetType == AssetType.total)
          LineChartBarData(
            spots: createYearlyTotalSpots(dataList),
            isCurved: false,
            color: UiConfig.greyColor,
            belowBarData: BarAreaData(
              show: true,
              color: UiConfig.greyColor.withOpacity(.1),
            ),
          ),
        if (widget.assetType == AssetType.income)
          LineChartBarData(
            spots: createYearlyIncomeSpots(dataList),
            isCurved: false,
            color: UiConfig.primaryColorSurface, // 수입 라인 색상
            belowBarData: BarAreaData(
              show: true,
              color: UiConfig.buttonColor.withOpacity(.2),
            ),
          ),
        if (widget.assetType == AssetType.expense)
          LineChartBarData(
            spots: createYearlyExpenseSpots(dataList),
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
              final monthLabels = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
              return Text(monthLabels[value.toInt() - 1], style: const TextStyle(color: Colors.black, fontSize: 12));
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
          child: LineChart(yearlyData(widget.transactionList)),
        ),
      ],
    );
  }
}
