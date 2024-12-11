import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/confirm_dialog_widget.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_button.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_item.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_item_new.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryListFragment extends ConsumerWidget {
  final String title;
  final AssetType assetType;
  final TextEditingController categorylistCreateController;
  final TextEditingController categorylistEditController;

  const CategoryListFragment({
    super.key,
    required this.title,
    required this.assetType,
    required this.categorylistCreateController,
    required this.categorylistEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    // 필터링된 데이터 가져오기
    final categories = categoryProvider.categoryList.where((category) => category.assetType == assetType).toList();

    return Tap(
      onTap: () {
        ref.read(categoryStateProvider.notifier).showCategoryCardNew(false);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedMoneyBag02,
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
                height: MediaQuery.of(context).size.height * 0.55,
                child: ListView.builder(
                  itemCount: categories.length + 1, // Add one for the button
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
                    } else {
                      // Display CategoryListButton at the end of the list
                      return Column(
                        children: [
                          if (assetType == AssetType.expense && categoryProvider.showExpenseCategoryCardNew)
                            CategoryListItemNew(assetType: assetType, categorylistCreateController: categorylistCreateController),
                          if (assetType == AssetType.income && categoryProvider.showIncomeCategoryCardNew)
                            CategoryListItemNew(assetType: assetType, categorylistCreateController: categorylistCreateController),
                          SizedBox(height: 8.h),
                          Tap(
                            onTap: () {
                              ref.read(categoryStateProvider.notifier).showCategoryCardNew(true, assetType: assetType);
                              ref.read(categoryStateProvider.notifier).showCategorySelectButton(assetType);
                            },
                            child: CategoryListButton(assetType: assetType),
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            else
              Column(
                children: [
                  if (assetType == AssetType.expense && categoryProvider.showExpenseCategoryCardNew)
                    CategoryListItemNew(assetType: assetType, categorylistCreateController: categorylistCreateController),
                  if (assetType == AssetType.income && categoryProvider.showIncomeCategoryCardNew)
                    CategoryListItemNew(assetType: assetType, categorylistCreateController: categorylistCreateController),
                  SizedBox(height: 8.h),
                  Tap(
                    onTap: () {
                      ref.read(categoryStateProvider.notifier).showCategoryCardNew(true, assetType: assetType);
                      ref.read(categoryStateProvider.notifier).showCategorySelectButton(assetType);
                    },
                    child: CategoryListButton(assetType: assetType),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
