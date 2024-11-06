import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/period_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_screen_state.freezed.dart';

@freezed
class ReportScreenState with _$ReportScreenState {
  const factory ReportScreenState({
    @Default(false) final bool isLoading,
    @Default(0) final double maxY,
    @Default(0) final double minY,
    @Default(Period.year) final Period period,
    @Default(AssetType.total) final AssetType assetType,
  }) = _ReportScreenState;
}
