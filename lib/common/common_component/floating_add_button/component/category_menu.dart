import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryMenu extends ConsumerWidget {
  const CategoryMenu({
    super.key,
    required this.duration,
    required this.isExpanded,
  });

  final Duration duration;
  final bool isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            Tap(
              onTap: () {
                ref.read(floatingButtonStateProvider.notifier).selectAssetType(AssetType.income);
                ref.read(floatingButtonStateProvider.notifier).toggleTransactionMenu();
              },
              child: FloatItem(
                title: '수입',
                imagePath: picSum(401),
              ),
            ),
            const SizedBox(height: 16),
            Tap(
              onTap: () {
                ref.read(floatingButtonStateProvider.notifier).selectAssetType(AssetType.expense);
                ref.read(floatingButtonStateProvider.notifier).toggleTransactionMenu();
              },
              child: FloatItem(
                title: '지출',
                imagePath: picSum(401),
              ),
            ),
          ],
        ),
      ),
    );
  }
}