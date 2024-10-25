import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropdownButton<T> extends ConsumerWidget {
  final List<DropdownMenuItem<T>> items;
  final String hints;
  final TextStyle? hintsStyle;
  final Function(T) action;
  final bool? expanded;

  const CustomDropdownButton({
    super.key,
    required this.action,
    required this.items,
    this.hints = '선택',
    this.hintsStyle,
    this.expanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ButtonTheme(
      alignedDropdown: true,
      child: SizedBox(
        width: 140.w,
        child: DropdownButton<T>(
          isExpanded: expanded ?? false,
          underline: const SizedBox.shrink(), // underline 없앰
          items: items,
          onChanged: (item) {
            if (item != null) {
              action(item);
            }
          },
          hint: SizedBox(
            width: 80.w,
            child: Text(
              hints,
              style: hintsStyle ?? UiConfig.bodyStyle,
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
