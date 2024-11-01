import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

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
        margin: const EdgeInsets.only(right: 15, bottom: 30),
        decoration: BoxDecoration(
          color: UiConfig.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            FloatItem<AssetType>(
              title: '수입',
              icon: HugeIcons.strokeRoundedLogoutSquare01,
              selectedValue: AssetType.income,
              onSelect: (AssetType assetType) async {
                ref.read(assetStateProvier.notifier).selectAssetType(assetType);
                ref.read(floatingButtonStateProvider.notifier).toggleTransactionMenu(assetType);
                await ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
                ref.read(floatingButtonStateProvider.notifier).tapCategory(assetType);
              },
              isSelected: ref.read(floatingButtonStateProvider).incomeSelected,
            ),
            const SizedBox(height: 16),
            FloatItem<AssetType>(
              title: '지출',
              icon: HugeIcons.strokeRoundedLoginSquare01,
              selectedValue: AssetType.expense,
              selectedColor: UiConfig.secondaryColor,
              onSelect: (AssetType assetType) async {
                ref.read(assetStateProvier.notifier).selectAssetType(assetType);
                ref.read(floatingButtonStateProvider.notifier).toggleTransactionMenu(assetType);
                await ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
                ref.read(floatingButtonStateProvider.notifier).tapCategory(assetType);
              },
              isSelected: ref.read(floatingButtonStateProvider).expenseSelected,
            ),
          ],
        ),
      ),
    );
  }
}
