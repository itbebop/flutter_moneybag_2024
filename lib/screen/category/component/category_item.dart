import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryItem extends ConsumerWidget {
  final AssetType assetType;
  final TransactionCategory category;

  const CategoryItem({
    super.key,
    required this.assetType,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    return GestureDetector(
      onLongPress: () => ref.read(categoryStateProvider.notifier).longPressCategoryItem(category: category),
      child: Card(
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
            if (category.categoryId == categoryProvider.selectedIconIdDelete && categoryProvider.showCategoryCardDelete)
              Positioned(
                top: 5.h,
                right: 5.w,
                child: Tap(
                  onTap: () {
                    ref.read(categoryStateProvider.notifier).cancelCategoryItemDelete();
                    ref.read(categoryStateProvider.notifier).deleteTransactionCategory(category.categoryId);
                    ref.read(categoryStateProvider.notifier).getTransactionCategory(category.type);
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 15,
                  ),
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HugeIcon(
                    color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                    icon: iconMap[category.iconKey],
                    size: 25,
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      category.name,
                      style: UiConfig.smallStyle.copyWith(
                        color: UiConfig.color[800],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
