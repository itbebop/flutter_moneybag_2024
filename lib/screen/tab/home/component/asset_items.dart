import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class AssetItems extends StatelessWidget {
  final String title;
  final double amounts;
  final Color numColor;

  AssetItems({
    super.key,
    required this.title,
    required this.amounts,
  }) : numColor = _getColorByTitle(title);

  static Color _getColorByTitle(String title) {
    switch (title) {
      case '수입':
        return UiConfig.secondaryTextColor;
      case '지출':
        return UiConfig.primaryColor;

      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          width: 100.w,
          child: Text(
            amounts.toWon(),
            style: TextStyle(fontSize: 18, color: numColor),
            textAlign: TextAlign.end, // 오른쪽 정렬 추가
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
