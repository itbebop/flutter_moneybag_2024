import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/screen/tab/report/riverpod/report_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportScreenStateNotifier = StateNotifierProvider<ReportScreenStateNotifier, ReportScreenState>((ref) => ReportScreenStateNotifier(ReportScreenState(
      getTransactionListUseCase: getIt(),
    )));

class ReportScreenStateNotifier extends StateNotifier<ReportScreenState> {
  ReportScreenStateNotifier(super.state);
}
