import 'package:flutter_moneybag_2024/domain/usecase/transaction/get_transaction_list_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_screen_state.freezed.dart';

@freezed
class ReportScreenState with _$ReportScreenState {
  const factory ReportScreenState({
    @Default(false) final bool isLoading,
    required final List<String> assetIdList,
    required final GetTransactionListUseCase getTransactionListUseCase,
  }) = _ReportScreenState;
}
