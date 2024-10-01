import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/report_fragment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationEditModeProvider = StateProvider((ref) => false);

class ReportScreen extends HookConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);

    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: UiConfig.primaryColor,
          padding: const EdgeInsets.all(16),
          // indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: const EdgeInsets.all(16),
          // labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          overlayColor: WidgetStatePropertyAll(
            Colors.blue.shade100,
          ),

          /// 탭바 클릭할 때 나오는 splash effect의 radius
          splashBorderRadius: BorderRadius.circular(10),
          tabs: const [
            Text('List'),
            Text('Chart'),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: const [
            ReportFragment(),
          ],
        ))
      ],
    );
  }
}
