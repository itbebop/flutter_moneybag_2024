import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryListItemUpdate extends ConsumerWidget {
  final TextEditingController categorylistCreateController;
  final AssetType assetType;

  const CategoryListItemUpdate({
    super.key,
    required this.assetType,
    required this.categorylistCreateController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
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
            Row(
              children: [
                HugeIcon(
                  icon: categoryProvider.selectedCreateIcon,
                  color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  height: 30.h,
                  width: 150.w,
                  child: TextField(
                    controller: categorylistCreateController,
                    style: UiConfig.bodyStyle,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      isDense: true, // vertical padding 없앰
                      // border: InputBorder.none,
                      // contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                ref.read(categoryStateProvider.notifier).createTransactionCategoryUseCase(
                      transactionCategory: TransactionCategory(
                        categoryId: 0,
                        categoryName: categorylistCreateController.text,
                        iconKey: categoryProvider.selectedIconName,
                        assetType: assetType,
                        level: 1,
                        userId: categoryProvider.userId,
                      ),
                    );
              },
              icon: const Icon(Icons.check),
            )
          ],
        ),
      ),
    );
  }
}
