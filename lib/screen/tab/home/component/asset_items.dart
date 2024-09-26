import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class AssetItems extends StatelessWidget {
  final String title;
  final int amounts;
  final Color numColor;

  AssetItems({
    super.key,
    required this.title,
    required this.amounts,
  }) : numColor = _getColorByTitle(title);

  static Color _getColorByTitle(String title) {
    switch (title) {
      case '수입':
        return Colors.green;
      case '지출':
        return Colors.red;

      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          amounts.toWon(),
          style: TextStyle(fontSize: 18, color: numColor),
        ),
      ],
    );
  }
}
