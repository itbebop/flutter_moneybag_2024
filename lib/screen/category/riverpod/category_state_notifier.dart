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
    int userId = 0;
    if (userState.user != null) {
      userId = userId = userState.user!.userId;
    }

    return CategoryStateNotifier(
      CategoryState(
        userId: userId,
        selectedCreateIcon: HugeIcons.strokeRoundedAddCircle,
        createTransactionCategoryUseCase: getIt(),
        getTransactionCategoryListUseCase: getIt(),
        getTransactionCategoryUseCase: getIt(),
        updateTransactionCategoryUseCase: getIt(),
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
      isExpanded: true,
      assetType: assetType,
      isVisibleButton: !state.isVisibleButton,
    );
  }

  void tapSelectButtonOutside() {
    state = state.copyWith(
      isVisibleButton: false,
      isExpanded: false,
    );
  }

  void tapIcon({required String selectedIconName}) {
    // update면
    if (state.showSubCategoryCardUpdate) {
      state = state.copyWith(
        selectedUpdateIcon: iconMap[selectedIconName],
        selectedIconName: selectedIconName,
      );
    } else {
      state = state.copyWith(
        selectedCreateIcon: iconMap[selectedIconName],
        selectedIconName: selectedIconName,
      );
    }
  }

  void cancelIconSelect(AssetType assetType) {
    if (assetType == AssetType.income) {
      state = state.copyWith(selectedCreateIcon: HugeIcons.strokeRoundedAddCircle);
    } else {
      state = state.copyWith(
        selectedCreateIcon: HugeIcons.strokeRoundedAddCircle,
      );
    }
  }

  void longPressCategoryItem({required TransactionCategory category}) {
    state = state.copyWith(
      selectedIconIdDelete: category.categoryId,
      showSubCategoryCardUpdate: true,
      // update card 열 때 server에서 받은 name을 넣음
      updatedIconName: category.categoryName,
    );
  }

  void tabListEditIcon() {
    state = state.copyWith(
      showCategoryCardUpdate: !state.showCategoryCardUpdate,
    );
  }

  void onTapUpdateTextfield() {
    state = state.copyWith(
      showCategoryNameFromServer: true,
    );
  }

  void cancelCategoryItemUpdate() {
    state = state.copyWith(
      showSubCategoryCardUpdate: false,
      showCategoryNameFromServer: false,
      selectedIconName: '',
      selectedUpdateIcon: null,
    );
  }

  void selectCategory({required TransactionCategory selectCategory}) {
    state = state.copyWith(
      categoryHints: selectCategory.categoryName,
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
    await state.createTransactionCategoryUseCase.execute(transactionCategory: transactionCategory);
  }

  Future<void> getTransactionCategoriesByAssetType(AssetType assetType) async {
    // TODO: cache 처리 방법
    List<TransactionCategory> categories = await state.getTransactionCategoryListUseCase.execute(userId: state.userId, level: 1);
    categories = categories.where((category) => category.assetType == assetType).toList();

    state = state.copyWith(
      categoryList: categories,
      assetType: assetType,
    );
  }

  Future<void> getTransactionCategoryById(int categoryId) async {
    final TransactionCategory category = await state.getTransactionCategoryUseCase.execute(categoryId: categoryId);
    state = state.copyWith(category: category);
  }

  Future<void> updateTransactionCategory(TransactionCategory transactionCategory) async {
    await state.updateTransactionCategoryUseCase.execute(transactionCategory: transactionCategory);
  }

  Future<void> deleteTransactionCategory(int categoryId) async {
    await state.deleteTransactionCategoryUseCase.execute(categoryId: categoryId);
  }

  Future<void> getSubTransactionCategories(int parentCategoryId) async {
    List<TransactionCategory> subCategories = await state.getTransactionCategoryListUseCase.execute(userId: state.userId, level: 2, parentCategoryId: parentCategoryId);

    state = state.copyWith(
      subCategoryList: subCategories,
    );
  }
}
