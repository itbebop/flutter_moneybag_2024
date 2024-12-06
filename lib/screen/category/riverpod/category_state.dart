import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/create_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/delete_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/get_transaction_category_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/update_transaction_category_user_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(false) bool isVisibleButton,
    @Default(false) bool isExpanded,
    @Default(false) bool showExpenseCategoryCardNew,
    @Default(false) bool showIncomeCategoryCardNew,
    @Default(false) bool showCategoryCardUpdate,
    @Default(false) bool showCategoryNameFromServer,
    @Default(false) bool showExpenseCategoryListItemNew,
    @Default(false) bool showIncomeCategoryListItemNew,
    @Default('') String selectedIconName,
    @Default('') String updatedIconName,
    @Default('') String categoryName,
    @Default(0) int selectedIconIdDelete,
    @Default(AssetType.income) AssetType assetType,
    @Default([]) List<TransactionCategory> categoryList,
    @Default([]) List<TransactionCategory> subCategoryList,
    TransactionCategory? category,
    required String categoryHints,
    required int userId,
    required IconData selectedCreateIcon,
    IconData? selectedUpdateIcon,
    required CreateTransactionCategoryUseCase createTransactionCategoryUseCase,
    required GetTransactionCategoryListUseCase getTransactionCategoryUseCase,
    required UpdateTransactionCategoryUseCase updateTransactionCategoryUseCase,
    required final DeleteTransactionCategoryUseCase deleteTransactionCategoryUseCase,
  }) = _CategoryState;
}
