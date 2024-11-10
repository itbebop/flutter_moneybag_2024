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
    final inComeTransactionCategories = ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
    final expenseTransactionCategories = ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
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
                return Column(
                  children: [
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
                                          // await ref.read(assetStateProvier.notifier).deleteAsset(assetProvider.allAssetList[index].assetId);
                                          // await ref.read(userStateProvider.notifier).fetchUser();
                                          // await ref.read(assetStateProvier.notifier).fetchAsset();
                                        });

                                    return null;
                                  },
                                  key: ValueKey(categories[index].categoryId),
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
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
