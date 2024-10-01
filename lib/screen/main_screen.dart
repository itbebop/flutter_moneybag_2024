import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/app_bottom_navigation_bar.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.dart';
import 'package:flutter_moneybag_2024/router/router.dart';
import 'package:flutter_moneybag_2024/screen/tab/Asset/asset_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/home_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/my_menu/my_menu_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/report_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/tab_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTabProvider = StateProvider<TabItem>((ref) => TabItem.home);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  TabItem get _currentTab => ref.watch(currentTabProvider);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              backgroundColor: UiConfig.backgroundColor,
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                    child: Text('Header'),
                  )
                ],
              ),
            ),
            body: Consumer(
              builder: (context, ref, _) {
                final currentIndex = ref.watch(bottomNavIndexProvider);

                // 선택된 인덱스에 따라 서로 다른 화면을 표시
                return IndexedStack(
                  index: currentIndex,
                  children: const [
                    HomeScreen(), // 첫 번째 화면
                    ReportScreen(),
                    HomeScreen(),
                    AssetScreen(),
                    MyMenuScreen(),
                  ],
                );
              },
            ),
            bottomNavigationBar: const AppBottomNavigationBar(), // 바텀 내비게이션
          ),
          AnimatedOpacity(
            opacity: _currentTab != TabItem.mymenu ? 1 : 0,
            duration: 300.ms,
            child: FloatingAddButton(),
          ),
        ],
      ),
    );
  }
}
