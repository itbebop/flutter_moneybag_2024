import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/category_screen.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item_button.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item_new.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../common/common.dart';

class CategoryList extends ConsumerWidget {
  final String title;
  final IconData icon;
  final AssetType assetType;
  final TextEditingController categoryNameEditController;

  const CategoryList({
    super.key,
    required this.title,
    required this.assetType,
    required this.icon,
    required this.categoryNameEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              HugeIcon(
                icon: icon,
                color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                size: 30,
              ),
              SizedBox(width: 8.w),
              Text(
                '$title 카테고리(20)',
                style: UiConfig.h1Style.copyWith(
                  color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                  fontWeight: UiConfig.semiBoldFont,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // TransactionCategory 타입의 GridView.builder 추가
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 한 줄에 4개의 아이템
                childAspectRatio: 1,
              ),
              itemCount: transactionCategories.length + 2, // 추가 버튼을 위한 2개의 item 추가
              itemBuilder: (context, index) {
                if (index < transactionCategories.length) {
                  final category = transactionCategories[index];
                  return CategoryItem(assetType: assetType, category: category);
                } else if (index == transactionCategories.length) {
                  if (categoryProvider.showIncomeCategoryCardNew && assetType == AssetType.income) {
                    return CategoryItemNew(
                      assetType: assetType,
                      categoryNameEditController: categoryNameEditController,
                    );
                  } else if (categoryProvider.showExpenseCategoryCardNew && assetType != AssetType.income) {
                    return CategoryItemNew(
                      assetType: assetType,
                      categoryNameEditController: categoryNameEditController,
                    );
                  } else {
                    return CategoryItemButton(
                      assetType: assetType,
                    );
                  }
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
