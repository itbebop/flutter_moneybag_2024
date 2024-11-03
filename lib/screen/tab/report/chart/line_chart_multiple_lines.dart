import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/line_chart_base.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LineChartMultipleLines extends ConsumerStatefulWidget {
  const LineChartMultipleLines({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LineChartMultipleLinesState();
}

class LineChartMultipleLinesState extends ConsumerState<LineChartMultipleLines> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    final reportProvider = ref.read(reportScreenStateProvider);
    return AspectRatio(
      aspectRatio: 1.23,
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 37,
              ),
              const SizedBox(
                height: 37,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 6),
                  child: LineChartBase(
                    isShowingMainData: isShowingMainData,
                    period: reportProvider.period,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
            ),
            onPressed: () {
              setState(() {
                isShowingMainData = !isShowingMainData;
              });
            },
          )
        ],
      ),
    );
  }
}
