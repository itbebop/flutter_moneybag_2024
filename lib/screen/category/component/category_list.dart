import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/widget/alert_dialog_widget.dart';
import 'package:flutter_moneybag_2024/common/widget/confirm_dialog_widget.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item_button.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item_new.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_item_update.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../common/common.dart';

class CategoryList extends ConsumerWidget {
  final String title;
  final IconData icon;
  final AssetType assetType;
  final TextEditingController categoryNameCreateController;
  final TextEditingController categoryNameEditController;

  const CategoryList({
    super.key,
    required this.title,
    required this.assetType,
    required this.icon,
    required this.categoryNameCreateController,
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
          ref.read(categoryStateProvider.notifier).cancelIconSelect(assetType);
          ref.read(categoryStateProvider.notifier).showCategoryCardNew(false, assetType: assetType);
          if (categoryProvider.showCategoryCardUpdate) {
            ConfirmDialogWidget.asyncInputDialog(context: context, title: '', message: '아이콘 변경을 취소하시겠습니까?', onConfirm: () => ref.read(categoryStateProvider.notifier).cancelCategoryItemUpdate());
          }
          categoryNameCreateController.clear();
          categoryNameEditController.clear();
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

                                // showCategoryCardUpdate가 true이고, 선택한 index인 경우 CategoryItemUpdate 반환
                                if (categoryProvider.showCategoryCardUpdate && category.categoryId == categoryProvider.selectedIconIdDelete) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            CategoryItemUpdate(
                                              assetType: assetType,
                                              category: TransactionCategory(
                                                categoryId: category.categoryId,
                                                name: category.name,
                                                iconKey: category.iconKey,
                                                type: category.type,
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
                                                ref.read(categoryStateProvider.notifier).getTransactionCategory(category.type);
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
                                                              name: categoryNameEditController.text,
                                                              iconKey: categoryProvider.selectedIconName == '' ? category.iconKey : categoryProvider.selectedIconName,
                                                              type: category.type,
                                                            ),
                                                          ),
                                                    );
                                                  }
                                                  AlertDialogWidget.showCustomDialog(context: context, title: ' ', content: '변경되었습니다');
                                                  await ref.read(categoryStateProvider.notifier).getTransactionCategory(category.type);
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
                                    assetType: assetType,
                                    category: category,
                                  );
                                }
                              } else if (index == categories.length) {
                                if (categoryProvider.showIncomeCategoryCardNew && assetType == AssetType.income) {
                                  return Stack(
                                    children: [
                                      CategoryItemNew(
                                        assetType: assetType,
                                        categoryNameCreateController: categoryNameCreateController,
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Tap(
                                          onTap: () {
                                            ref.read(categoryStateProvider.notifier).createTransactionCategoryUseCase(
                                                  transactionCategory: TransactionCategory(
                                                    categoryId: '0',
                                                    name: categoryNameCreateController.text,
                                                    iconKey: categoryProvider.selectedIconName,
                                                    type: assetType,
                                                  ),
                                                );
                                            ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
                                            ref.read(categoryStateProvider.notifier).cancelIconSelect(assetType);
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
                                } else if (categoryProvider.showExpenseCategoryCardNew && assetType != AssetType.income) {
                                  return Stack(
                                    children: [
                                      CategoryItemNew(
                                        assetType: assetType,
                                        categoryNameCreateController: categoryNameCreateController,
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Tap(
                                          onTap: () {
                                            ref.read(categoryStateProvider.notifier).createTransactionCategoryUseCase(
                                                  transactionCategory: TransactionCategory(
                                                    categoryId: '0',
                                                    name: categoryNameCreateController.text,
                                                    iconKey: categoryProvider.selectedIconName,
                                                    type: assetType,
                                                  ),
                                                );
                                            ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
                                            ref.read(categoryStateProvider.notifier).cancelIconSelect(assetType);
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
