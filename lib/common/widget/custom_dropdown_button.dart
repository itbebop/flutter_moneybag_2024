import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final String hints;
  final TextStyle? hintsStyle;
  final Function(T) action;
  final bool? expanded;
  final double? width;
  final double? textWidth;
  final TextAlign? textAlign;
  final bool isSelected;

  const CustomDropdownButton({
    super.key,
    required this.action,
    required this.items,
    required this.hints,
    this.hintsStyle,
    this.expanded,
    this.width = 140,
    this.textWidth = 95,
    this.textAlign = TextAlign.left,
    this.isSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: SizedBox(
        width: width!.w,
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
            width: textWidth!.w,
            child: Text(
              hints,
              style: hintsStyle ?? UiConfig.bodyStyle,
              overflow: TextOverflow.clip,
              softWrap: false,
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}
