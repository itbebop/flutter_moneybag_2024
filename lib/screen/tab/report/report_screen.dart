import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/report_flow_fragment.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/report_proportion_fragment.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationEditModeProvider = StateProvider((ref) => false);

class ReportScreen extends HookConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final userState = ref.watch(userStateProvider);
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: UiConfig.primaryColorSurface,
          padding: const EdgeInsets.all(8),
          indicatorSize: TabBarIndicatorSize.tab,
          // labelPadding: const EdgeInsets.all(16),
          labelPadding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

          /// 탭바 클릭할 때 나오는 splash effect의 radius
          splashBorderRadius: BorderRadius.circular(10),
          tabs: [
            Text(
              '자산흐름',
              style: UiConfig.h4Style,
            ),
            Text(
              '카테고리',
              style: UiConfig.h4Style,
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              ReportFlowFragment(),
              ReportProportionFragment(),
            ],
          ),
        ),
        if (userState.user == null)
          Column(
            children: [
              const Text('로그인 후 이용하실 수 있습니다.'),
              SizedBox(height: 16.h),
              TextButton(
                onPressed: () => context.push('/login'),
                child: const Text('> 로그인 페이지로 이동하기'),
              ),
              SizedBox(height: 32.h),
            ],
          )
      ],
    );
  }
}
