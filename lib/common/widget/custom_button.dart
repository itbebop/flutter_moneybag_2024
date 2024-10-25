import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Color buttonColor;
  final TextStyle? textStyle;
  final EdgeInsets? edgeInsets;
  const CustomButton({
    super.key,
    required this.name,
    required this.buttonColor,
    this.textStyle,
    this.edgeInsets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 36, right: 36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: Text(
        name,
        style: textStyle ?? UiConfig.h4Style,
      ),
    );
  }
}
