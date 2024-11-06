import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportScreenStateProvider = StateNotifierProvider<ReportScreenStateNotifier, ReportScreenState>((ref) {
  return ReportScreenStateNotifier(const ReportScreenState());
});

class ReportScreenStateNotifier extends StateNotifier<ReportScreenState> {
  ReportScreenStateNotifier(super.state);

  void tapPeriod(Period period) {
    state = state.copyWith(period: period);
  }

  void changeAssetType(AssetType assetType) {
    state = state.copyWith(assetType: assetType);
  }
}
