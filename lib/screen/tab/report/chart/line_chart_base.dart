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

  // 월별 데이터 그룹화 후 amount 합산
  Map<int, double> mothlySum(List<TransactionDetail> transactionList) {
    print(transactionList);
    Map<int, double> monthlySums = {};
    for (var transaction in transactionList) {
      int month = transaction.createdAt.month;
      monthlySums[month] = (monthlySums[month] ?? 0) + transaction.amount;
    }
    return monthlySums;
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
      maxX: 13, // 원래 12인데 10~12 간격상, 보기에 13이 나아서 13으로 함
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
        maxX: 7, // 7 days in a week
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

// leftTitleWidgets 수정
  Widget leftTitleWidgets(double value, TitleMeta meta, List<TransactionDetail> transactionList) {
    // 월별 합산 금액 구하기
    Map<int, double> monthlySum(List<TransactionDetail> transactionList) {
      Map<int, double> monthlySums = {};
      for (var transaction in transactionList) {
        int month = transaction.createdAt.month;
        monthlySums[month] = (monthlySums[month] ?? 0) + transaction.amount;
      }
      return monthlySums;
    }

    // 월별 합산 후 양수, 음수 최대값 구하기
    final monthlySums = monthlySum(transactionList);
    // final positiveMax = monthlySums.values.where((amount) => amount > 0).reduce((a, b) => a > b ? a : b);
    // final negativeMax = monthlySums.values.where((amount) => amount < 0).reduce((a, b) => a < b ? a : b).abs();
// 양수 최대값 계산
    final positiveMax = monthlySums.values.where((amount) => amount > 0).isEmpty ? 0 : monthlySums.values.where((amount) => amount > 0).reduce((a, b) => a > b ? a : b);

// 음수 최대값 계산
    final negativeMax = monthlySums.values.where((amount) => amount < 0).isEmpty ? 0 : monthlySums.values.where((amount) => amount < 0).reduce((a, b) => a < b ? a : b).abs();

    double maxPoint;
    double firstPoint;

    String formatAmount(double amount) {
      return amount >= 1e4 ? '${(amount / 1e4).toInt()}만' : '${amount.toInt()}원';
    }

    if (positiveMax > 0 && negativeMax == 0) {
      // 양수만 있는 경우
      maxPoint = positiveMax.toDouble();
      firstPoint = maxPoint / 5;
      switch (value) {
        case 1:
          return Text(formatAmount(firstPoint));
        case 2:
          return Text(formatAmount(firstPoint * 2));
        case 3:
          return Text(formatAmount(firstPoint * 3));
        case 4:
          return Text(formatAmount(firstPoint * 4));
        case 5:
          return Text(formatAmount(maxPoint));
        default:
          return Container();
      }
    } else if (positiveMax == 0 && negativeMax > 0) {
      // 음수만 있는 경우
      maxPoint = negativeMax.toDouble();
      firstPoint = maxPoint / 5;
      switch (value) {
        case -1:
          return Text('-${formatAmount(firstPoint)}');
        case -2:
          return Text('-${formatAmount(firstPoint * 2)}');
        case -3:
          return Text('-${formatAmount(firstPoint * 3)}');
        case -4:
          return Text('-${formatAmount(firstPoint * 4)}');
        case -5:
          return Text('-${formatAmount(maxPoint)}');
        default:
          return Container();
      }
    } else if (positiveMax > 0 && negativeMax > 0) {
      // 양수와 음수가 모두 있는 경우
      maxPoint = positiveMax.toDouble();
      firstPoint = maxPoint / 3;
      double negativeFirstPoint = negativeMax / 3;
      switch (value) {
        case -3:
          return Text('-${formatAmount(negativeFirstPoint * 3)}');
        case -2:
          return Text('-${formatAmount(negativeFirstPoint * 2)}');
        case -1:
          return Text('-${formatAmount(negativeFirstPoint * 1)}');
        case 1:
          return Text(formatAmount(firstPoint));
        case 2:
          return Text(formatAmount(firstPoint * 2));
        case 3:
          return Text(formatAmount(maxPoint));
        default:
          return Container();
      }
    }
    return Container();
  }

// 월별 데이터 그룹화 후 amount 합산 후, 각 월의 amount 합계로 FlSpot 리스트를 생성
  List<FlSpot> createYearlySpots(List<TransactionDetail> dataList) {
    // 월별 합산 금액 계산
    Map<int, double> monthlySums = mothlySum(dataList);

    // 정의된 구간 값들 (이 값들은 leftTitleWidgets에서 설정된 구간과 동일하게 맞춰야 함)
    final pointValues = [-5.0, -4.0, -3.0, -2.0, -1.0]; // 낮은 값부터 높은 값으로 변경
    final thresholds = [-14.0, -11.0, -8.0, -5.0, -2.0]; // 작은 값에서 큰 값 순으로 설정

    // FlSpot 생성, 없는 월은 제외
    return monthlySums.entries.map((entry) {
      double x = entry.key.toDouble();
      double entryValue = entry.value / 1e4; // '만' 단위로 변환
      double y = 0; // 초기값 설정

      print("Processing month: $x with entryValue: $entryValue"); // 디버깅 로그

      bool matched = false;

      // entryValue가 주어진 구간(thresholds)에 해당하는 y값(pointValues)을 계산
      for (int i = 0; i < thresholds.length - 1; i++) {
        double lowerThreshold = thresholds[i];
        double upperThreshold = thresholds[i + 1];
        double lowerPoint = pointValues[i];
        double upperPoint = pointValues[i + 1];

        if (entryValue >= lowerThreshold && entryValue <= upperThreshold) {
          // 구간 내의 비율 계산
          double ratio = (entryValue - lowerThreshold) / (upperThreshold - lowerThreshold);
          y = lowerPoint + ratio * (upperPoint - lowerPoint);
          matched = true;
          print("Matched range: ($lowerThreshold, $upperThreshold), calculated y: $y"); // 디버깅 로그
          break;
        }
      }

      // entryValue가 모든 구간보다 작은 경우, 가장 낮은 point 값을 할당
      if (!matched && entryValue < thresholds.first) {
        y = pointValues.first;
        print("Below lowest threshold, assigned y: $y for entryValue: $entryValue");

        // entryValue가 모든 구간보다 큰 경우, 가장 높은 point 값을 할당
      } else if (!matched && entryValue > thresholds.last) {
        y = pointValues.last;
        print("Above highest threshold, assigned y: $y for entryValue: $entryValue");
      }

      // 로그 추가
      print("Generated FlSpot(x: $x, y: $y) for entryValue: $entryValue");

      return FlSpot(x, y);
    }).toList();
  }

  List<LineChartBarData> lineBarsData(List<TransactionDetail> yearlyData) {
    // print('####createYearlySpots(yearlyData): ${createYearlySpots(yearlyData)}');
    return [
      LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: createYearlySpots(yearlyData),
      ),
    ];
  }

  SideTitles leftTitles(List<TransactionDetail> transactionList) {
    // print('###transactionList in leftTitiles : $transactionList');
    return SideTitles(
      getTitlesWidget: (value, meta) => leftTitleWidgets(value, meta, transactionList),
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );
  }

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
}
