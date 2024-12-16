import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/line_chart_monthly.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/line_chart_weely.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/line_chart_yearly.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LineChartMultipleLines extends ConsumerStatefulWidget {
  final AssetType assetType;
  const LineChartMultipleLines({
    super.key,
    required this.assetType,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LineChartMultipleLinesState();
}

class LineChartMultipleLinesState extends ConsumerState<LineChartMultipleLines> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    _fetchData();
  }

  Future<void> _fetchData() async {
    await ref.read(transactionStateProvider.notifier).getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final reportProvider = ref.watch(reportScreenStateProvider);
    final transactionProvider = ref.read(transactionStateProvider);

    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: UiConfig.whiteColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0, left: 16, right: 8),
                    child: reportProvider.period == Period.year
                        ? LineChartYearly(
                            assetType: widget.assetType,
                            period: reportProvider.period,
                            transactionList: transactionProvider.activatedTransactionList,
                          )
                        : reportProvider.period == Period.month
                            ? LineChartMonthly(
                                assetType: widget.assetType,
                                period: reportProvider.period,
                                transactionList: transactionProvider.activatedTransactionList,
                              )
                            : LineChartWeekly(
                                assetType: widget.assetType,
                                period: reportProvider.period,
                                transactionList: transactionProvider.activatedTransactionList,
                              ),
                  ),
                ),
              ),
              SizedBox(height: 8.h), // Assuming 8.h is a defined height
            ],
          ),
        ],
      ),
    );
  }
}
