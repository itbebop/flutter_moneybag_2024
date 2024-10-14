import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final WidgetRef ref;

  const FloatItem({super.key, required this.title, required this.imagePath, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        ref.read(floatingButtonStateProvider.notifier).toggleTransactionMenu();
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
