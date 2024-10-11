import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(color: UiConfig.whiteColor),
        selectedItemColor: UiConfig.whiteColor,
        unselectedIconTheme: const IconThemeData(color: UiConfig.primaryColor),
        unselectedItemColor: UiConfig.primaryColor,
        backgroundColor: UiConfig.primaryColorSurface,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Report',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.transparent,
            ),
            label: '',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Asset',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'My Menu', // TODO: 내메뉴에서는 Floating button 안보이게
          ),
        ],
      ),
    );
  }
}
