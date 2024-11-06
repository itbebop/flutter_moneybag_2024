import 'dart:math';

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

  LineChartData chartData(List<TransactionDetail> filteredTransactionList) {
    switch (period) {
      case Period.year:
        return yearlyData(filteredTransactionList);
      case Period.month:
        return monthlyData(filteredTransactionList);
      case Period.week:
      default:
        return yearlyData(filteredTransactionList);
    }
  }

// Method to filter transactions based on the selected period
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

// 날짜별 총합 계산 함수
  Map<String, Map<int, double>> calculateMonthlySums(List<TransactionDetail> transactionList) {
    // 양수와 음수로 분리된 데이터 리스트
    final incomeData = transactionList.where((t) => t.amount > 0).toList();
    final expenseData = transactionList.where((t) => t.amount < 0).toList();

    // 각각 월별로 데이터 합산
    Map<int, double> incomeMonthlySum = monthlySum(incomeData);
    Map<int, double> expenseMonthlySum = monthlySum(expenseData);

    // 양수+음수 합계 데이터를 월별로 계산
    final totalMonthlySum = <int, double>{};
    for (int month = 1; month <= 12; month++) {
      final incomeAmount = incomeMonthlySum[month] ?? 0;
      final expenseAmount = expenseMonthlySum[month] ?? 0;
      totalMonthlySum[month] = incomeAmount + expenseAmount;
    }

    // 결과를 Map으로 반환하여 각각 income, expense, total로 구분된 데이터 제공
    return {
      'income': incomeMonthlySum,
      'expense': expenseMonthlySum,
      'total': totalMonthlySum,
    };
  }

  // Define the LineChartData methods with updated minX, maxX, and custom title configurations
  LineChartData yearlyData(List<TransactionDetail> transactionList) {
    return LineChartData(
      lineTouchData: lineTouchData,
      gridData: gridData,
      titlesData: titlesData(transactionList),
      borderData: borderData,
      lineBarsData: lineBarsData(transactionList),
      minX: 0,
      maxX: 13, // 원래 12인데 10~12 간격상, 보기에 13이 나아서 13으로 함
      maxY: 5,
      minY: 0,
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
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.2),
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

/*
LeftTile 계산 시작
*/
  Widget leftTitleWidgets(double value, TitleMeta meta, List<TransactionDetail> transactionList) {
    final monthlySums = calculateMonthlySums(transactionList);
    // income, expense, total 데이터를 분리
    final incomeData = monthlySums['income'] ?? {};
    final expenseData = monthlySums['expense'] ?? {};
    final totalData = monthlySums['total'] ?? {};

    // 양수 최대값 계산 (income에서)
    final positiveMax = incomeData.values.isEmpty ? 0 : incomeData.values.where((amount) => amount > 0).reduce((a, b) => a > b ? a : b);
    print('#######positiveMax (income max): $positiveMax');

    // 음수 최대값 계산 (expense에서)
    final negativeMax = expenseData.values.isEmpty ? 0 : expenseData.values.where((amount) => amount < 0).reduce((a, b) => a < b ? a : b).abs();
    print('#######negativeMax (expense max): $negativeMax');

    // 합계 최대값 계산 (total에서)
    final totalMax = totalData.values.isEmpty ? 0 : totalData.values.reduce((a, b) => a > b ? a : b);
    print('#######totalMax: $totalMax');

    // 최종 최대 포인트 결정
    double rawMaxPoint = negativeMax.toDouble(); // 양수 최대값과 합계 최대값 중 큰 값 선택

    // 가장 큰 자리수를 기준으로 올림 처리
    int magnitude = (rawMaxPoint / 10).ceil().toString().length - 1; // 자리수 계산
    double roundUpFactor = pow(10, magnitude).toDouble(); // 올림할 기준 생성
    double maxPoint = (rawMaxPoint / roundUpFactor).ceil() * roundUpFactor; // 올림하여 maxPoint 설정

    print('#######maxPoint (rounded up): $maxPoint');
    double firstPoint = maxPoint / 5;

    String formatAmount(double amount) {
      return amount >= 1e4 ? '${(amount / 1e4).toInt()}만원' : '${amount.toInt()}원';
    }

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
  }

// 월별 데이터 그룹화 후 amount 합산 후, 각 월의 amount 합계로 FlSpot 리스트를 생성
  List<FlSpot> createYearlySpots(List<TransactionDetail> dataList) {
    // 월별 데이터 그룹화 후 amount 합산
    Map<int, double> monthlySum(List<TransactionDetail> transactionList) {
      Map<int, double> monthlySums = {};
      for (var transaction in transactionList) {
        int month = transaction.createdAt.month;
        monthlySums[month] = (monthlySums[month] ?? 0) + transaction.amount;
      }
      return monthlySums;
    }

    // 월별 합산 금액 계산
    Map<int, double> monthlySums = monthlySum(dataList);

    // 정의된 구간 값들 (이 값들은 leftTitleWidgets에서 설정된 구간과 동일하게 맞춰야 함)
    final pointValues = [1.0, 2.0, 3.0, 4.0, 5.0]; // 낮은 값부터 높은 값으로 변경
    final thresholds = [2.0, 5.0, 8.0, 11.0, 14.0]; // 작은 값에서 큰 값 순으로 설정

    // FlSpot 생성, 없는 월은 제외
    return monthlySums.entries.map((entry) {
      double x = entry.key.toDouble();
      double entryValue = entry.value.abs() / 1e4; // '만' 단위로 변환, 절대값 사용
      double y = 0; // 초기값 설정
      bool matched = false;

      print("Processing month: $x with entryValue: $entryValue"); // 디버깅 로그

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
      reservedSize: 45, // 왼쪽 기준 간격
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
