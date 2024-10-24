import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_daangn_button.state.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvider = StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needToMakeButtonBigger = false;

  void toggleCategoryMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;
    state = state.copyWith(isExpanded: !isExpanded, isSmall: needToMakeButtonBigger ? false : true);

    // 초기화
    if (needToMakeButtonBigger) {
      needToMakeButtonBigger = false;
    }
    // 버튼 커져있는 상태 && expand되지 않은 (layer 띄운) 상태
    if (!isSmall && !isExpanded) {
      needToMakeButtonBigger = true;
    }
    if (isSmall) state = state.copyWith(isClassified: !isSmall);
    if (state.expenseSelected || state.incomeSelected) {
      state = state.copyWith(expenseSelected: false, incomeSelected: false);
    }
  }

  void changeButtonSize(bool isSmall) {
    state = state.copyWith(isSmall: isSmall);
  }

  void toggleTransactionMenu() {
    final isClassified = state.isClassified;
    state = state.copyWith(isClassified: !isClassified);
  }

  void quitWrite({
    required TextEditingController memoEditController,
    required TextEditingController amountEditController,
  }) {
    memoEditController.clear();
    amountEditController.clear();
  }

  void tapOutside() {
    state = state.copyWith(
      isExpanded: false,
      isClassified: false,
      expenseSelected: false,
      incomeSelected: false,
    );
  }

  void tapCategory<T>(T selectedValue) {
    if (selectedValue == AssetType.expense && !state.incomeSelected) {
      state = state.copyWith(expenseSelected: !state.expenseSelected);
    } else if (selectedValue == AssetType.income && !state.expenseSelected) {
      state = state.copyWith(incomeSelected: !state.incomeSelected);
    } else {
      state = state.copyWith(incomeSelected: false, expenseSelected: false);
    }
  }
}
