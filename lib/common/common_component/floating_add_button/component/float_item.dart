import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class FloatItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function? action;

  const FloatItem({super.key, required this.title, required this.imagePath, this.action});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        if (action != null) {
          action!();
        }
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imagePath,
              width: 30,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(title),
        ],
      ),
    );
  }
}
