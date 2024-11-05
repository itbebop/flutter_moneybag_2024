import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/temporary_app_color.dart';

class LineChartBase extends StatelessWidget {
  const LineChartBase({
    super.key,
    required this.period,
    required this.transactionList,
  });

  final Period period;
  final List<TransactionDetail> transactionList;

  @override
  Widget build(BuildContext context) {
    // Filter transactionList based on `createdAt` and the selected `period`
    final filteredTransactionList = filterTransactionsByPeriod(transactionList);

    return LineChart(
      chartData(filteredTransactionList),
      duration: const Duration(milliseconds: 250),
    );
  }

  // Method to filter transactions based on the selected period
  List<TransactionDetail> filterTransactionsByPeriod(List<TransactionDetail> transactions) {
    final now = DateTime.now();
    return transactions.where((transaction) {
      final date = transaction.createdAt;
      switch (period) {
        case Period.year:
          return date.year == now.year;
        case Period.month:
          return date.year == now.year && date.month == now.month;
        case Period.week:
        default:
          final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday as start of week
          return date.isAfter(startOfWeek) && date.isBefore(startOfWeek.add(const Duration(days: 7)));
      }
    }).toList();
  }

  LineChartData chartData(List<TransactionDetail> filteredTransactionList) {
    switch (period) {
      case Period.year:
        return yearlyData(filteredTransactionList);
      case Period.month:
        return monthlyData(filteredTransactionList);
      case Period.week:
      default:
        return weeklyData(filteredTransactionList);
    }
  }

  // Define the LineChartData methods with updated minX, maxX, and custom title configurations
  LineChartData yearlyData(List<TransactionDetail> transactionList) {
    // amount 값이 양수인지 음수인지 확인
    bool hasPositive = transactionList.any((transaction) => transaction.amount > 0);
    bool hasNegative = transactionList.any((transaction) => transaction.amount < 0);

    // minY와 maxY 설정
    double minY;
    double maxY;

    if (hasPositive && hasNegative) {
      minY = -3;
      maxY = 3;
    } else if (hasPositive) {
      minY = 0;
      maxY = 5;
    } else if (hasNegative) {
      minY = -5;
      maxY = 0;
    } else {
      // 양수, 음수 모두 없을 때 기본 값 설정 (필요시 조정)
      minY = 0;
      maxY = 0;
    }

    return LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData(transactionList),
      borderData: borderData,
      lineBarsData: lineBarsData(transactionList),
      minX: 0,
      maxX: 5,
      maxY: maxY,
      minY: minY,
    );
  }

  LineChartData monthlyData(List<TransactionDetail> transactionList) => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData(transactionList),
        borderData: borderData,
        lineBarsData: lineBarsData(transactionList),
        minX: 0,
        maxX: 4, // 4 weeks in a month
        maxY: 5,
        minY: 0,
      );

  LineChartData weeklyData(List<TransactionDetail> transactionList) => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData(transactionList),
        borderData: borderData,
        lineBarsData: lineBarsData(transactionList),
        minX: 0,
        maxX: 6, // 7 days in a week
        maxY: 5,
        // maxY: maxY(transactionList, 7),
        minY: 0,
      );

  // Reusable line touch data across charts
  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData titlesData(List<TransactionDetail> transactionList) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(transactionList),
      ),
      topTitles: const AxisTitles(
        // Disable top titles
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        // Disable right titles
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, List<TransactionDetail> transactionList) {
    final maxTransactionAmount = transactionList.map((t) => t.amount).reduce((a, b) => a > b ? a : b);
    print('#####maxTransactionAmount: $maxTransactionAmount');
    // final multiplier = period == Period.year
    //     ? 365
    //     : period == Period.month
    //         ? 30
    //         : 7;
    double maxPoint = 0;
    if (maxTransactionAmount > 1e4) {
      maxPoint = maxTransactionAmount.toInt() / 1e4;
    }

    final double firstPoint = maxPoint / 5;

    double point;

    switch (value) {
      case 1:
        point = firstPoint;
        break;
      case 2:
        point = firstPoint * 2;
        break;
      case 3:
        point = firstPoint * 3;
        break;
      case 4:
        point = firstPoint * 4;
        break;
      case 5:
        point = maxPoint;
        break;
      case -1:
        point = -firstPoint;
        break;
      case -2:
        point = -firstPoint * 2;
        break;
      case -3:
        point = -firstPoint * 3;
        break;
      case -4:
        point = -firstPoint * 4;
        break;
      case -5:
        point = -maxPoint;
        break;
      default:
        return Container();
    }
    return Text('${(point.toInt()).toString()}만', textAlign: TextAlign.center, style: const TextStyle(fontSize: 12));
  }

  SideTitles leftTitles(List<TransactionDetail> transactionList) => SideTitles(
        getTitlesWidget: (value, meta) => leftTitleWidgets(value, meta, transactionList),
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    String text;
    switch (period) {
      case Period.year:
        text = yearlyBottomTitle(value);
        break;
      case Period.month:
        text = monthlyBottomTitle(value);
        break;
      case Period.week:
      default:
        text = weeklyBottomTitle(value);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 10, child: Text(text, style: style));
  }

  String yearlyBottomTitle(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Jan';
      case 3:
        return 'Apr';
      case 6:
        return 'Jul';
      case 9:
        return 'Oct';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  String monthlyBottomTitle(double value) {
    final weekNum = value.toInt() + 1;
    return 'Week $weekNum';
  }

  String weeklyBottomTitle(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Mon';
      case 1:
        return 'Wed';
      case 2:
        return 'Fri';
      case 3:
        return 'Sun';
      default:
        return '';
    }
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );
  List<LineChartBarData> lineBarsData(List<TransactionDetail> yearlyData) {
    // 각 월의 amount 합계를 계산하고, FlSpot 리스트를 생성
    List<FlSpot> createYearlySpots(List<TransactionDetail> dataList) {
      // 월별 데이터 그룹화 후 amount 합산
      Map<int, double> monthlySums = {};
      for (var transaction in dataList) {
        int month = transaction.createdAt.month;
        monthlySums[month] = (monthlySums[month] ?? 0) + transaction.amount;
      }

      // FlSpot 생성, 없는 월은 제외
      return monthlySums.entries.map((entry) {
        double x = entry.key.toDouble();
        double y = entry.value / 1e6; // 1e6으로 나눠서 단위를 맞춤
        return FlSpot(x, y);
      }).toList();
    }

    return [
      LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, -2.8),
          FlSpot(7, -1.2),
          FlSpot(10, -2.8),
          FlSpot(12, -2.6),
          FlSpot(13, -3.9),
        ],
      ),
    ];
  }
}
