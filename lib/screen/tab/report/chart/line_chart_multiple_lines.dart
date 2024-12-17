import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
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
    ref.read(transactionStateProvider.notifier).getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final reportProvider = ref.watch(reportScreenStateProvider);

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
                    child: StreamBuilder<List<TransactionDetail>>(
                      stream: ref.watch(transactionStateProvider.notifier).getTransactions(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          // 오류 처리
                          return const Center(
                            child: Text('데이터를 불러오는 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.'),
                          );
                        }
                        if (!snapshot.hasData) {
                          // 로딩 상태 처리
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        // 스트림에서 데이터를 가져옴
                        final transactionList = snapshot.data!;

                        // 조건에 따라 적절한 차트 위젯 렌더링
                        return reportProvider.period == Period.year
                            ? LineChartYearly(
                                assetType: widget.assetType,
                                period: reportProvider.period,
                                transactionList: transactionList,
                              )
                            : reportProvider.period == Period.month
                                ? LineChartMonthly(
                                    assetType: widget.assetType,
                                    period: reportProvider.period,
                                    transactionList: transactionList,
                                  )
                                : LineChartWeekly(
                                    assetType: widget.assetType,
                                    period: reportProvider.period,
                                    transactionList: transactionList,
                                  );
                      },
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
