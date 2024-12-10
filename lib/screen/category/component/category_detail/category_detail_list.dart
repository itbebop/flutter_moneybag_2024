import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/common/widget/alert_dialog_widget.dart';
import 'package:flutter_moneybag_2024/common/widget/confirm_dialog_widget.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_detail/category_item.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_detail/category_item_button.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_detail/category_item_new.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_detail/category_item_update.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../common/common.dart';

class CategoryDetailList extends ConsumerWidget {
  final TransactionCategory parentCategory;
  final TextEditingController categoryNameCreateController;
  final TextEditingController categoryNameEditController;

  const CategoryDetailList({
    super.key,
    required this.parentCategory,
    required this.categoryNameCreateController,
    required this.categoryNameEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    categoryProvider.showCategoryCardUpdate ? categoryNameEditController.text = parentCategory.categoryName : null;

    return Tap(
      onTap: () {
        ref.read(categoryStateProvider.notifier).cancelIconSelect(parentCategory.assetType);
        ref.read(categoryStateProvider.notifier).showCategoryCardNew(false);
        if (categoryProvider.showCategoryCardUpdate) {
          ConfirmDialogWidget.asyncInputDialog(context: context, title: '', message: '아이콘 변경을 취소하시겠습니까?', onConfirm: () => ref.read(categoryStateProvider.notifier).cancelCategoryItemUpdate());
        }
        categoryNameCreateController.clear();
        categoryNameEditController.clear();
      },
      child: Column(
        children: [
          if (!categoryProvider.showCategoryCardUpdate)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    HugeIcon(
                      icon: iconMap[parentCategory.iconKey],
                      color: parentCategory.assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                      size: 30,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      parentCategory.categoryName,
                      style: UiConfig.h1Style.copyWith(
                        color: parentCategory.assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                        fontWeight: UiConfig.semiBoldFont,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    ref.read(categoryStateProvider.notifier).tabListEditIcon();
                  },
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedPencilEdit02,
                    color: parentCategory.assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                  ),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    HugeIcon(
                      icon: iconMap[parentCategory.iconKey],
                      color: UiConfig.greyColor,
                      size: 30,
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 150.w, // TODO: 글자크기에 따라서
                      child: TextField(
                        controller: categoryNameEditController,
                        decoration: const InputDecoration(
                          isDense: true, // vertical padding 없앰
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        style: UiConfig.h1Style.copyWith(
                          color: UiConfig.greyColor,
                          decorationThickness: 0,
                          fontWeight: UiConfig.semiBoldFont,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    ref.read(categoryStateProvider.notifier).tabListEditIcon();
                  },
                  icon: HugeIcon(
                    icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                    color: parentCategory.assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                  ),
                ),
              ],
            ),
          SizedBox(height: 16.h),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 한 줄에 4개의 아이템
                      childAspectRatio: 1,
                    ),
                    itemCount: categoryProvider.subCategoryList.length + 2, // 추가 버튼을 위한 2개의 item 추가
                    itemBuilder: (context, index) {
                      if (index < categoryProvider.subCategoryList.length) {
                        final category = categoryProvider.subCategoryList[index];

                        // showCategoryCardUpdate가 true이고, 선택한 index인 경우 CategoryItemUpdate 반환
                        if (categoryProvider.showCategoryCardUpdate && category.categoryId == categoryProvider.selectedIconIdDelete) {
                          return Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    CategoryItemUpdate(
                                      assetType: parentCategory.assetType,
                                      category: TransactionCategory(
                                        categoryId: category.categoryId,
                                        categoryName: category.categoryName,
                                        iconKey: category.iconKey,
                                        assetType: category.assetType,
                                        level: 1,
                                        userId: categoryProvider.userId,
                                      ),
                                      categoryNameEditController: categoryNameEditController,
                                    ),
                                    Tap(
                                      onTap: () async {
                                        await ConfirmDialogWidget.asyncInputDialog(
                                          context: context,
                                          title: '',
                                          message: '아이콘을 삭제하시겠습니까?',
                                          onConfirm: () => ref.read(categoryStateProvider.notifier).deleteTransactionCategory(category.categoryId),
                                        );
                                        ref.read(categoryStateProvider.notifier).getTransactionCategoryByAssetType(category.assetType);
                                        return AlertDialogWidget.showCustomDialog(context: context, title: '', content: '삭제되었습니다');
                                      },
                                      child: SizedBox(
                                        width: 20,
                                        child: Image.asset('assets/icon/minus_icon.png'),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Tap(
                                        onTap: () async {
                                          if (categoryProvider.showCategoryCardUpdate) {
                                            await ConfirmDialogWidget.asyncInputDialog(
                                              context: context,
                                              title: '',
                                              message: '아이콘을 변경하시겠습니까?',
                                              onConfirm: () => ref.read(categoryStateProvider.notifier).updateTransactionCategory(
                                                    TransactionCategory(
                                                      categoryId: category.categoryId,
                                                      categoryName: categoryNameEditController.text,
                                                      iconKey: categoryProvider.selectedIconName == '' ? category.iconKey : categoryProvider.selectedIconName,
                                                      assetType: category.assetType,
                                                      level: 1,
                                                      userId: categoryProvider.userId,
                                                    ),
                                                  ),
                                            );
                                          }
                                          AlertDialogWidget.showCustomDialog(context: context, title: ' ', content: '변경되었습니다');
                                          await ref.read(categoryStateProvider.notifier).getTransactionCategoryByAssetType(category.assetType);
                                          ref.read(categoryStateProvider.notifier).cancelCategoryItemUpdate();
                                        },
                                        child: SizedBox(
                                          width: 20,
                                          child: Image.asset('assets/icon/check_icon.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return CategoryItem(
                            assetType: parentCategory.assetType,
                            category: category,
                          );
                        }
                      } else if (index == categoryProvider.subCategoryList.length) {
                        if (parentCategory.assetType == AssetType.expense ? categoryProvider.showExpenseCategoryCardNew : categoryProvider.showIncomeCategoryCardNew) {
                          return Stack(
                            children: [
                              CategoryItemNew(
                                assetType: parentCategory.assetType,
                                categoryNameCreateController: categoryNameCreateController,
                              ),
                              Positioned(
                                right: 0,
                                child: Tap(
                                  onTap: () async {
                                    await ref.read(categoryStateProvider.notifier).createTransactionCategoryUseCase(
                                          transactionCategory: TransactionCategory(
                                            categoryId: parentCategory.categoryId,
                                            categoryName: categoryNameCreateController.text,
                                            iconKey: categoryProvider.selectedIconName,
                                            assetType: parentCategory.assetType,
                                            level: 2,
                                            userId: categoryProvider.userId,
                                            parentCategoryId: parentCategory.categoryId,
                                          ),
                                        );
                                    await ref.read(categoryStateProvider.notifier).getSubTransactionCategories(parentCategory.categoryId);
                                    ref.read(categoryStateProvider.notifier).cancelIconSelect(parentCategory.assetType);
                                    categoryNameCreateController.clear();
                                    ref.read(categoryStateProvider.notifier).showCategoryCardNew(false);
                                  },
                                  child: SizedBox(
                                    width: 20,
                                    child: Image.asset('assets/icon/check_icon.png'),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return CategoryItemButton(
                            assetType: parentCategory.assetType,
                          );
                        }
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
