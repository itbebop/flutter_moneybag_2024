import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';

class CategoryListItem extends ConsumerWidget {
  final TransactionCategory category;
  final AssetType assetType;
  const CategoryListItem({
    super.key,
    required this.category,
    required this.assetType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Tap(
              onTap: () async {
                await ref.read(categoryStateProvider.notifier).getSubTransactionCategories(category.categoryId);
                await ref.read(categoryStateProvider.notifier).getTransactionCategoryById(category.categoryId);
                if (context.mounted) {
                  context.push('/category_detail', extra: category);
                }
              },
              child: Row(
                children: [
                  HugeIcon(
                    icon: iconMap[category.iconKey],
                    color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    category.categoryName,
                    style: UiConfig.h3Style.copyWith(
                      color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
            )
          ],
        ),
      ),
    );
  }
}
