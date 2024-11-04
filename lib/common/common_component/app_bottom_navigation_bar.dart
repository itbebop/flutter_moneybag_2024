import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

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
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome12,
              color: selectedIndex == 0 ? UiConfig.whiteColor : UiConfig.primaryColor,
            ),
            label: 'Home',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedPresentationLineChart01,
              color: selectedIndex == 1 ? UiConfig.whiteColor : UiConfig.primaryColor,
            ),
            label: 'Report',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: UiConfig.primaryColor,
            ),
            label: '',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedMoneyBag02,
              color: selectedIndex == 3 ? UiConfig.whiteColor : UiConfig.primaryColor,
            ),
            label: 'Asset',
            backgroundColor: UiConfig.primaryColorSurface,
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedSettings01,
              color: selectedIndex == 4 ? UiConfig.whiteColor : UiConfig.primaryColor,
            ),
            label: 'My Menu',
          ),
        ],
      ),
    );
  }
}
