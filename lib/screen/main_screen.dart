import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/app_bottom_navigation_bar.dart';
import 'package:flutter_moneybag_2024/common/common_component/menu_drawer.dart';
import 'package:flutter_moneybag_2024/router/router.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/home_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/my_menu/my_menu_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MyMenuScreen(), // 두 번째 화면
            ],
          );
        },
      ),
      bottomNavigationBar: const AppBottomNavigationBar(), // 바텀 내비게이션
    );
  }
}
