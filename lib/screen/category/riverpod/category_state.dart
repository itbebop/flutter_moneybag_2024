import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/create_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/get_transaction_category_list_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(false) bool isVisibleButton,
    @Default(false) bool isExpanded,
    @Default(false) bool showExpenseCategoryCardNew,
    @Default(false) bool showIncomeCategoryCardNew,
    @Default('') String selectedIconName,
    @Default(AssetType.income) AssetType assetType,
    required String userId,
    required IconData selectedIncomeIcon,
    required IconData selectedExpenseIcon,
    required CreateTransactionCategoryUseCase createTransactionCategoryUseCase,
    required GetTransactionCategoryListUseCase getTransactionCategoryListUseCase,
  }) = _CategoryState;
}