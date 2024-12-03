import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/confirm_dialog_widget.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_button.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_item.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_item_new.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryList extends ConsumerWidget {
  final String title;
  final AssetType assetType;
  final TextEditingController categorylistCreateController;

  const CategoryList({
    super.key,
    required this.title,
    required this.assetType,
    required this.categorylistCreateController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);

    // 필터링된 데이터 가져오기
    final categories = categoryProvider.categoryList.where((category) => category.assetType == assetType).toList();
    // final categories = categoryProvider.categoryList;

    return Tap(
      onTap: () {
        ref.read(categoryStateProvider.notifier).showCategoryCardNew(false);
      },
      child: Column(
        children: [
          Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedHome02,
                color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: UiConfig.h3Style.copyWith(
                  color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (categories.isNotEmpty)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                itemCount: categories.length + 1,
                itemBuilder: (context, index) {
                  if (index < categories.length) {
                    final category = categories[index];
                    return Column(
                      children: [
                        Dismissible(
                          confirmDismiss: (direction) async {
                            await ConfirmDialogWidget.asyncInputDialog(
                              context: context,
                              title: '',
                              message: '삭제하시겠습니까?',
                              onConfirm: () async {
                                // 삭제 로직
                              },
                            );
                            return null;
                          },
                          key: ValueKey(category.categoryId),
                          background: Container(
                            color: UiConfig.deleteBackColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [SizedBox(width: 20.w), const HugeIcon(icon: HugeIcons.strokeRoundedDeleteThrow, color: UiConfig.whiteColor)],
                            ),
                          ),
                          secondaryBackground: Container(
                            color: UiConfig.deleteBackColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const HugeIcon(icon: HugeIcons.strokeRoundedDeleteThrow, color: UiConfig.whiteColor),
                                SizedBox(width: 20.w),
                              ],
                            ),
                          ),
                          child: CategoryListItem(
                            assetType: assetType,
                            category: category,
                          ),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    );
                  } else if (index == categories.length) {
                    return Column(
                      children: [
                        if (assetType == AssetType.expense && !categoryProvider.showExpenseCategoryCardNew)
                          Tap(
                            onTap: () {
                              ref.read(categoryStateProvider.notifier).showCategoryCardNew(true, assetType: AssetType.expense);
                              ref.read(categoryStateProvider.notifier).showCategorySelectButton(AssetType.expense);
                            },
                            child: const CategoryListButton(assetType: AssetType.expense),
                          ),
                        if (assetType == AssetType.income && !categoryProvider.showIncomeCategoryCardNew)
                          Tap(
                            onTap: () {
                              ref.read(categoryStateProvider.notifier).showCategoryCardNew(true, assetType: AssetType.income);
                              ref.read(categoryStateProvider.notifier).showCategorySelectButton(AssetType.income);
                            },
                            child: const CategoryListButton(assetType: AssetType.income),
                          ),
                        SizedBox(height: 8.h),
                        if (assetType == AssetType.expense && categoryProvider.showExpenseCategoryCardNew)
                          CategoryListItemNew(assetType: assetType, categorylistCreateController: categorylistCreateController),
                        if (assetType == AssetType.income && categoryProvider.showIncomeCategoryCardNew)
                          CategoryListItemNew(assetType: assetType, categorylistCreateController: categorylistCreateController),
                      ],
                    );
                  }
                  return null;
                },
              ),
            )
          else
            const Center(child: Text('데이터가 없습니다.')),
        ],
      ),
    );
  }
}
