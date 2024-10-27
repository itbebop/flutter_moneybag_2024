import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryItemNew extends ConsumerWidget {
  final TextEditingController categoryNameEditController;
  final AssetType assetType;
  const CategoryItemNew({
    super.key,
    required this.assetType,
    required this.categoryNameEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
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
              top: 5.h,
              right: 5.w,
              child: Tap(
                onTap: () => ref.read(categoryStateProvider.notifier).createTransactionCategoryUseCase(
                      transactionCategory: TransactionCategory(
                        categoryId: '0',
                        name: categoryNameEditController.text,
                        iconKey: categoryProvider.selectedIconName,
                        type: assetType,
                      ),
                    ),
                child: const Icon(
                  Icons.check,
                  size: 15,
                ),
              )),
          Positioned(
            top: 5.h,
            left: 5.w,
            child: Tap(
              onTap: () {
                ref.read(categoryStateProvider.notifier).showCategoryCardNew(false, assetType: assetType);
                ref.read(categoryStateProvider.notifier).cancelIconSelect(assetType);
              },
              child: const Icon(
                Icons.close,
                size: 15,
              ),
            ),
          ),
          Positioned(
              top: 25.h,
              right: 30.w,
              child: Tap(
                onTap: () => ref.read(categoryStateProvider.notifier).showCategorySelectButton(assetType),
                child: HugeIcon(
                  icon: assetType == AssetType.income ? categoryProvider.selectedIncomeIcon : categoryProvider.selectedExpenseIcon,
                  size: 25,
                  color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                ),
              )),
          Positioned(
            bottom: 15.h,
            right: 17.w,
            child: SizedBox(
              width: 50.w,
              height: 30.h,
              child: TextField(
                controller: categoryNameEditController,
                style: UiConfig.smallStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '카테고리명',
                  hintStyle: UiConfig.extraSmallStyle.copyWith(
                    color: UiConfig.color[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
