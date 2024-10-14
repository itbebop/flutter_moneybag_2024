import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/app_bottom_navigation_bar.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/drawer_widget.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/Asset/asset_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/home_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/my_menu/my_menu_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/report_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int get _currentTab => ref.watch(bottomNavIndexProvider);
  bool isButtonVisible = true;

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
            drawer: const Drawer(
              child: DrawerWidget(),
            ),
            onDrawerChanged: (isOpen) {
              setState(() {
                isButtonVisible = !isOpen;
              });
            },
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
          isButtonVisible && _currentTab != 4
              ? AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 300),
                  child: FloatingAddButton(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
