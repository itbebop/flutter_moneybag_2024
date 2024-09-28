import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

enum TabItem {
  home(Icons.home, '홈'),
  report(Icons.holiday_village_outlined, '내역'),
  mymenu(Icons.person_outline_rounded, '내 메뉴');

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;

  const TabItem(this.activeIcon, this.tabName, {IconData? inActiveIcon}) : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated ? UiConfig.primaryColor : UiConfig.primaryColorSurface,
        ),
        label: tabName);
  }
}
