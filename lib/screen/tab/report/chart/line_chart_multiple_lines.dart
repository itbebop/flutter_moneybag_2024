import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/line_chart_base.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/temporary_app_color.dart';

class LineChartMultipleLines extends StatefulWidget {
  const LineChartMultipleLines({super.key});

  @override
  State<StatefulWidget> createState() => LineChartMultipleLinesState();
}

class LineChartMultipleLinesState extends State<LineChartMultipleLines> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
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
                  child: LineChartBase(isShowingMainData: isShowingMainData),
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
