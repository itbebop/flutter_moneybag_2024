import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/chart/line_chart_multiple_lines.dart';
import 'package:flutter_moneybag_2024/common/data/month_list.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ReportFlowFragment extends ConsumerStatefulWidget {
  const ReportFlowFragment({super.key});
  @override
  ConsumerState<ReportFlowFragment> createState() => _ReportListFragmentState();
}

class _ReportListFragmentState extends ConsumerState<ReportFlowFragment> {
  DateTime now = DateTime.now();
  MonthList selectedMonth = MonthList.jan;
  String currentMonth = DateFormat('MMM').format(DateTime.now()).toLowerCase();
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    // 현재 월에 해당하는 MonthList 항목으로 selectedMonth 초기화
    selectedMonth = MonthList.values.firstWhere(
      (e) => e.toString().split('.')[1] == currentMonth,
      orElse: () => MonthList.jan,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(height: 8.h),
      Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: Container(
              decoration: const BoxDecoration(
                color: UiConfig.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 8.w),
                      Tap(
                        onTap: () async {
                          ref.read(reportScreenStateProvider.notifier).tapPeriod(Period.year);
                          await ref.read(transactionStateProvider.notifier).selectActivatedTransactionList();
                        },
                        child: Container(
                          height: 45.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: ref.watch(reportScreenStateProvider).period == Period.year ? UiConfig.primaryColorSurface : UiConfig.whiteColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '연간',
                              style: TextStyle(
                                color: ref.watch(reportScreenStateProvider).period == Period.year ? UiConfig.whiteColor : UiConfig.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Tap(
                        onTap: () async {
                          ref.read(reportScreenStateProvider.notifier).tapPeriod(Period.month);
                          await ref.read(transactionStateProvider.notifier).selectActivatedTransactionList();
                        },
                        child: Container(
                          height: 45.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: ref.watch(reportScreenStateProvider).period == Period.month ? UiConfig.primaryColorSurface : UiConfig.whiteColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '월간',
                              style: TextStyle(
                                color: ref.watch(reportScreenStateProvider).period == Period.month ? UiConfig.whiteColor : UiConfig.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Tap(
                        onTap: () async {
                          ref.read(reportScreenStateProvider.notifier).tapPeriod(Period.week);
                          await ref.read(transactionStateProvider.notifier).selectActivatedTransactionList();
                        },
                        child: Container(
                          height: 45.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: ref.watch(reportScreenStateProvider).period == Period.week ? UiConfig.primaryColorSurface : UiConfig.whiteColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            // border: Border.all(
                            //   width: 1,
                            // ),
                          ),
                          child: Center(
                            child: Text(
                              '주간',
                              style: TextStyle(
                                color: ref.watch(reportScreenStateProvider).period == Period.week ? UiConfig.whiteColor : UiConfig.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(height: 350.h, child: _ImagePager(pageController: pageController)),
      SizedBox(height: 16.h),
    ]);
  }
}

class _ImagePager extends StatelessWidget {
  const _ImagePager({
    required this.pageController,
  });

  final PageController pageController;
  // final SimpleProductPost simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              LineChartMultipleLines(assetType: AssetType.total),
              LineChartMultipleLines(assetType: AssetType.expense),
              LineChartMultipleLines(assetType: AssetType.income),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: 3,
                effect: const JumpingDotEffect(
                  verticalOffset: 10,
                  dotColor: UiConfig.buttonColor,
                  activeDotColor: UiConfig.primaryColorSurface,
                  dotHeight: 12,
                  dotWidth: 12,
                ), // your preferred effect
                onDotClicked: (index) {}),
          )
        ],
      ),
    );
  }
}
