import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryItemUpdate extends ConsumerWidget {
  final AssetType assetType;
  final TransactionCategory category;
  final TextEditingController subCategoryNameEditController;
  const CategoryItemUpdate({
    super.key,
    required this.assetType,
    required this.category,
    required this.subCategoryNameEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    !categoryProvider.showCategoryNameFromServer ? subCategoryNameEditController.text = categoryProvider.updatedIconName : null;
    return Card(
      color: UiConfig.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 18.h,
            right: 29.5.w,
            child: Tap(
              onTap: () => ref.read(categoryStateProvider.notifier).showCategorySelectButton(assetType),
              child: HugeIcon(
                color: UiConfig.greyColor,
                icon: categoryProvider.selectedUpdateIcon ?? iconMap[category.iconKey],
                size: 25,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                controller: subCategoryNameEditController,
                style: UiConfig.smallStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: UiConfig.h2Style.copyWith(color: UiConfig.whiteColor),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: UiConfig.whiteColor),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: UiConfig.whiteColor),
                  ),
                ),
                onTap: () => ref.read(categoryStateProvider.notifier).onTapUpdateTextfield(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
