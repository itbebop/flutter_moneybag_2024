import 'package:flutter_moneybag_2024/common/common_component/transaction_category/transaction_category_state.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final transactionCategoryStateProvider = StateNotifierProvider<TransactionCategoryStateNotifier, TransactionCategoryState>((ref) {
  final userState = ref.watch(userStateProvier);
  final userId = userState.when(
    data: (user) => user.userId,
    loading: () => '', // 로딩 중일 때 기본값
    error: (error, stackTrace) => '', // 에러 발생 시 기본값
  );

  return TransactionCategoryStateNotifier(TransactionCategoryState(
    createTransactionCategoryUseCase: getIt(),
    deleteTransactionCategoryUseCase: getIt(),
    getTransactionCategoryListUseCase: getIt(),
    updateTransactionCategoryUseCase: getIt(),
    userId: userId,
  ));
});

class TransactionCategoryStateNotifier extends StateNotifier<TransactionCategoryState> {
  TransactionCategoryStateNotifier(super.transactionCategoryState);

  Future<void> createTransactionCategory(TransactionCategory transactionCategory) async {
    await state.createTransactionCategoryUseCase.execute(transactionCategory: transactionCategory, userId: state.userId);
  }
}
