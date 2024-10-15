import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    super.key,
    required this.duration,
    required this.isExpanded,
    required this.action,
  });

  final Duration duration;
  final bool isExpanded;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: isExpanded ? 1 : 0,
      child: Container(
        width: isExpanded ? 160 : 1,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 15, bottom: 20),
        decoration: BoxDecoration(
          color: UiConfig.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            FloatItem(
              title: '수입',
              imagePath: picSum(401),
              action: () {
                action();
              },
            ),
            const SizedBox(height: 8),
            FloatItem(
              title: '지출',
              imagePath: picSum(404),
              action: () {
                action();
              },
            ),
          ],
        ),
      ),
    );
  }
}
