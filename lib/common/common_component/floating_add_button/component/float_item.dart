import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class FloatItem<T> extends ConsumerWidget {
  final bool? isSelected;
  final String title;
  final IconData icon;
  final Function(T value) onSelect;
  final T selectedValue;
  final Color iconColor;

  const FloatItem({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor = UiConfig.black,
    required this.onSelect,
    required this.selectedValue,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tap(
      onTap: () {
        onSelect(selectedValue); // 콜백 함수 호출
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: isSelected ?? false ? UiConfig.buttonColor : UiConfig.whiteColor,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: HugeIcon(icon: icon, color: iconColor),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
