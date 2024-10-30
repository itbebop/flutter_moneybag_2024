import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/common/widget/alert_dialog_widget.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

final categoryStateProvider = StateNotifierProvider<CategoryStateNotifier, CategoryState>(
  (ref) {
    final userState = ref.watch(userStateProvider);
    String userId = '';
    if (userState.user != null) {
      userId = userState.user!.userId;
    }

    return CategoryStateNotifier(
      CategoryState(
        userId: userId,
        selectedIncomeIcon: HugeIcons.strokeRoundedAddCircle,
        selectedExpenseIcon: HugeIcons.strokeRoundedAddCircle,
        createTransactionCategoryUseCase: getIt(),
        getTransactionCategoryListUseCase: getIt(),
        deleteTransactionCategoryUseCase: getIt(),
        categoryHints: '선택',
      ),
    );
  },
);

class CategoryStateNotifier extends StateNotifier<CategoryState> {
  CategoryStateNotifier(super.state);
  void showCategoryCardNew(bool showNew, {AssetType? assetType}) {
    if (assetType == AssetType.income) {
      if (showNew) {
        state = state.copyWith(
          showIncomeCategoryCardNew: showNew,
          showExpenseCategoryCardNew: !showNew,
        );
      } else {
        state = state.copyWith(
          showIncomeCategoryCardNew: showNew,
        );
      }
    } else if (assetType == AssetType.expense) {
      if (showNew) {
        state = state.copyWith(
          showExpenseCategoryCardNew: showNew,
          showIncomeCategoryCardNew: !showNew,
        );
      } else {
        state = state.copyWith(
          showExpenseCategoryCardNew: showNew,
        );
      }
    } else {
      if (!showNew) {
        state = state.copyWith(
          showIncomeCategoryCardNew: showNew,
          showExpenseCategoryCardNew: showNew,
        );
      }
    }
  }

  void showCategorySelectButton(AssetType assetType) {
    state = state.copyWith(
      assetType: assetType,
      isVisibleButton: !state.isVisibleButton,
      isExpanded: !state.isExpanded,
    );
  }

  void tapOutside() {
    state = state.copyWith(
      isVisibleButton: false,
      isExpanded: false,
    );
  }

  void tapIcon({required AssetType assetType, required String selectedIconName}) {
    if (assetType == AssetType.income) {
      state = state.copyWith(
        selectedIncomeIcon: iconMap[selectedIconName],
        selectedIconName: selectedIconName,
      );
    } else {
      state = state.copyWith(
        selectedExpenseIcon: iconMap[selectedIconName],
        selectedIconName: selectedIconName,
      );
    }
  }

  void cancelIconSelect(AssetType assetType) {
    if (assetType == AssetType.income) {
      state = state.copyWith(selectedIncomeIcon: HugeIcons.strokeRoundedAddCircle);
    } else {
      state = state.copyWith(selectedExpenseIcon: HugeIcons.strokeRoundedAddCircle);
    }
  }

  void longPressCategoryItem({required TransactionCategory category}) {
    state = state.copyWith(
      selectedIconIdDelete: category.categoryId,
      showCategoryCardDelete: true,
    );
  }

  void cancelCategoryItemDelete() {
    state = state.copyWith(showCategoryCardDelete: false);
  }

  void selectCategory({required TransactionCategory selectCategory}) {
    state = state.copyWith(
      categoryHints: selectCategory.name,
      category: selectCategory,
    );
  }

  void quitWrite() {
    state = state.copyWith(
      categoryHints: '선택',
      category: null,
    );
  }

  bool onEnterWithoutSelect(BuildContext context) {
    bool result = false;
    if (state.categoryHints == '선택' || state.category == null) {
      AlertDialogWidget.showCustomDialog(context: context, title: '', content: '카테고리를 선택해주세요');
      result = true;
    }
    return result;
  }

  Future<void> createTransactionCategoryUseCase({required TransactionCategory transactionCategory}) async {
    await state.createTransactionCategoryUseCase.execute(transactionCategory: transactionCategory, userId: state.userId);
  }

  Future<List<TransactionCategory>> getTransactionCategory(AssetType assetType) async {
    List<TransactionCategory> categories = await state.getTransactionCategoryListUseCase.execute(userId: state.userId);
    if (assetType == AssetType.income) {
      categories = categories.where((category) => category.type == AssetType.income).toList();
      state = state.copyWith(categoryList: categories);
    } else {
      categories = categories.where((category) => category.type == AssetType.expense).toList();
      state = state.copyWith(categoryList: categories);
    }
    return categories;
  }

  Future<void> deleteTransactionCategory(String categoryId) async {
    await state.deleteTransactionCategoryUseCase.execute(categoryId: categoryId, userId: state.userId);
  }
}
