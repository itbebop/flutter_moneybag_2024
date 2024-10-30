import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
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
    final inComeTransactionCategories = ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
    final expenseTransactionCategories = ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
    final categoryProvider = ref.watch(categoryStateProvider);
    return Expanded(
      child: Tap(
        onTap: () {
          ref.read(categoryStateProvider.notifier).showCategoryCardNew(false, assetType: assetType);
          ref.read(categoryStateProvider.notifier).cancelIconSelect(assetType);
          ref.read(categoryStateProvider.notifier).cancelCategoryItemDelete();
        },
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
            StreamBuilder<List<TransactionCategory>>(
              stream: assetType == AssetType.income ? inComeTransactionCategories.asStream() : expenseTransactionCategories.asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // 에러 발생 시 Snackbar로 메시지 표시
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('잠시 후에 다시 시도해주세요')),
                    );
                  });
                  return const Center(child: Text('데이터가 없습니다.')); // 기본 상태로 변경
                } else if (snapshot.hasData) {
                  final categories = snapshot.data!;
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, // 한 줄에 4개의 아이템
                              childAspectRatio: 1,
                            ),
                            itemCount: categories.length + 2, // 추가 버튼을 위한 2개의 item 추가
                            itemBuilder: (context, index) {
                              if (index < categories.length) {
                                final category = categories[index];
                                return CategoryItem(assetType: assetType, category: category);
                              } else if (index == categories.length) {
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
                } else {
                  // snapshot이 데이터도 없고 에러도 없는 경우 (기본적으로 빈 상태일 경우)
                  return const Center(child: Text('데이터가 없습니다.'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
