import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportScreenStateProvider = StateNotifierProvider<ReportScreenStateNotifier, ReportScreenState>((ref) {
  final assetState = ref.watch(assetStateProvier);
  final List<String> assetIdList = assetState.allAssetIdList;

  return ReportScreenStateNotifier(ReportScreenState(getTransactionListUseCase: getIt(), assetIdList: assetIdList));
});

class ReportScreenStateNotifier extends StateNotifier<ReportScreenState> {
  ReportScreenStateNotifier(super.state);

  Future<List<TransactionDetail>> getTransactionList() async {
    return await state.getTransactionListUseCase.execute(state.assetIdList);
  }
}
