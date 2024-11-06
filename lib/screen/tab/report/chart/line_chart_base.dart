import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class LineChartBase extends StatefulWidget {
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
  _LineChartBaseState createState() => _LineChartBaseState();
}

class _LineChartBaseState extends State<LineChartBase> {
  double maxY = 200; // 기본 maxY 값, 20만 단위
  double minY = -30; // 기본 minY 값

  List<TransactionDetail> filterTransactionsByPeriod(List<TransactionDetail> transactions) {
    final now = DateTime.now();
    return transactions.where((transaction) {
      final date = transaction.createdAt;
      switch (widget.period) {
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
      case 0:
        text = '0';
        break;
      case 1:
        text = '5만';
        break;
      case 2:
        text = '10만';
        break;
      case 3:
        text = '15만';
        break;
      case 4:
        text = '20만';
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
      return FlSpot(month.toDouble(), (sums[month] ?? 0) / 10000); // 만 단위로 표시
    });
  }

  LineChartData yearlyData(dataList, maxPoints) {
    return LineChartData(
      maxY: maxY,
      minY: minY,
      lineBarsData: [
        LineChartBarData(
          spots: createYearlySpots(dataList, maxPoints),
          isCurved: true,
          // colors: [Colors.blue],
          belowBarData: BarAreaData(
            show: true,
            // colors: [Colors.lightBlue.withOpacity(0.3)],
          ),
        ),
      ],
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
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

  void increaseScale() {
    setState(() {
      maxY += 1;
      minY -= 1;
    });
  }

  void decreaseScale() {
    setState(() {
      if (maxY > 1) maxY -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: decreaseScale,
            ),
            const Text('Zoom'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: increaseScale,
            ),
          ],
        ),
        Expanded(
          child: LineChart(yearlyData(widget.transactionList, widget.maxY)),
        ),
      ],
    );
  }
}
