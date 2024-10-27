import 'package:flutter_moneybag_2024/common/data/icon_list.dart';
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
      ),
    );
  },
);

class CategoryStateNotifier extends StateNotifier<CategoryState> {
  CategoryStateNotifier(super.state);
  void showCategoryCardNew(bool showNew, {AssetType? assetType}) {
    if (assetType == AssetType.income) {
      state = state.copyWith(showIncomeCategoryCardNew: showNew);
    } else {
      state = state.copyWith(showExpenseCategoryCardNew: showNew);
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
      state = state.copyWith(selectedIncomeIcon: iconMap[selectedIconName], selectedIconName: selectedIconName);
    } else {
      state = state.copyWith(selectedExpenseIcon: iconMap[selectedIconName]);
    }
  }

  void cancelIconSelect(AssetType assetType) {
    if (assetType == AssetType.income) {
      state = state.copyWith(selectedIncomeIcon: HugeIcons.strokeRoundedAddCircle);
    } else {
      state = state.copyWith(selectedExpenseIcon: HugeIcons.strokeRoundedAddCircle);
    }
  }

  Future<void> createTransactionCategoryUseCase({required TransactionCategory transactionCategory}) async {
    await state.createTransactionCategoryUseCase.execute(transactionCategory: transactionCategory, userId: state.userId);
  }

  Future<List<TransactionCategory>> getTransactionCetegory(AssetType assetType) async {
    List<TransactionCategory> categories = await state.getTransactionCategoryListUseCase.execute(userId: state.userId);
    print('11111');
    if (assetType == AssetType.income) {
      categories = categories.where((category) => category.type == AssetType.income).toList();
      print('categories income: $categories');
    } else {
      categories = categories.where((category) => category.type == AssetType.expense).toList();
      print('categories expense: $categories');
    }
    return categories;
  }
}
