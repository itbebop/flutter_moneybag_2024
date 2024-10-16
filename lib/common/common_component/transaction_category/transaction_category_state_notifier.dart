import 'package:flutter_moneybag_2024/common/common_component/transaction_category/transaction_category_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionCategoryStateProvider = StateNotifierProvider<TransactionCategoryStateNotifier, TransactionCategoryState>((ref) => TransactionCategoryStateNotifier(TransactionCategoryState(
      createTransactionCategoryUseCase: getIt(),
      deleteTransactionCategoryUseCase: getIt(),
      getTransactionCategoryListUseCase: getIt(),
      updateTransactionCategoryUseCase: getIt(),
    )));

class TransactionCategoryStateNotifier extends StateNotifier<TransactionCategoryState> {
  TransactionCategoryStateNotifier(super.transactionCategoryState);

  Future<void> createTransactionCategory(TransactionCategory transactionCategory) async {
    await state.createTransactionCategoryUseCase.execute(transactionCategory: transactionCategory);
  }
}
