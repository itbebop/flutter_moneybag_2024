import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportScreenStateProvider = StateNotifierProvider<ReportScreenStateNotifier, ReportScreenState>((ref) => ReportScreenStateNotifier(ReportScreenState(
      getTransactionListUseCase: getIt(),
    )));

class ReportScreenStateNotifier extends StateNotifier<ReportScreenState> {
  ReportScreenStateNotifier(super.state);

  Future<List<TransactionDetail>> getTransactionList(String userId, String assetId) async {
    return await state.getTransactionListUseCase.execute(userId, 'assetId');
  }
}
