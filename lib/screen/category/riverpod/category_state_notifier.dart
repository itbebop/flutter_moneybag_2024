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
    if (state.showCategoryCardUpdate) {
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
      showCategoryCardUpdate: true,
      // update card 열 때 server에서 받은 name을 넣음
      updatedIconName: category.categoryName,
    );
  }

  void onTapUpdateTextfield() {
    state = state.copyWith(
      showCategoryNameFromServer: true,
    );
  }

  void cancelCategoryItemUpdate() {
    state = state.copyWith(
      showCategoryCardUpdate: false,
      showCategoryNameFromServer: false,
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

  Future<void> createSubTransactionCategoryUseCase({required TransactionCategory transactionCategory, required String subCategoryId}) async {
    // await state.createSubTransactionCategoryUseCase.execute(transactionCategory: transactionCategory, userId: state.userId, subCategoryId: subCategoryId);
  }
  Future<List<TransactionCategory>> getTransactionAllCategory() async {
    final cachedCategories = state.categoryList;

    // 이미 데이터가 캐시에 존재하는 경우 API 호출 생략
    if (cachedCategories.isNotEmpty) {
      return cachedCategories;
    }

    // 새 데이터를 가져옵니다.
    List<TransactionCategory> categories = await state.getTransactionCategoryUseCase.execute(userId: state.userId);

    // 상태 업데이트: 변경된 경우에만 상태를 갱신
    if (state.categoryList != categories) {
      state = state.copyWith(categoryList: categories);
    }

    return categories;
  }

  Future<List<TransactionCategory>> getSubTransactionCategoryList({required int categoryId}) async {
    // final List<TransactionCategory> categories = await state.getSubTransactionCategoryUseCase.execute(categoryId: categoryId, userId: state.userId);
    final List<TransactionCategory> categories = [];
    return categories;
  }

  /* Category list  */
  // void tapCategoryListButton(AssetType assetType) {
  //   if (assetType == AssetType.income) {
  //     state = state.copyWith(showIncomeCategoryListItemNew: true);
  //   } else {
  //     state = state.copyWith(showExpenseCategoryListItemNew: true);
  //   }

  // }

  Future<void> createTransactionCategoryUseCase({required TransactionCategory transactionCategory}) async {
    await state.createTransactionCategoryUseCase.execute(transactionCategory: transactionCategory);
  }

  Future<List<TransactionCategory>> getTransactionCategoryByAssetType(AssetType assetType) async {
    state = state.copyWith(categoryList: []);
    // 새 데이터를 가져옵니다.
    List<TransactionCategory> categories = await state.getTransactionCategoryUseCase.execute(userId: state.userId);
    categories = categories.where((category) => category.assetType == assetType).toList();

    state = state.copyWith(categoryList: categories);

    return categories;
  }

  Future<void> updateTransactionCategory(TransactionCategory transactionCategory) async {
    await state.updateTransactionCategoryUseCase.execute(transactionCategory: transactionCategory);
  }

  Future<void> deleteTransactionCategory(int categoryId) async {
    await state.deleteTransactionCategoryUseCase.execute(categoryId: categoryId);
  }
}
