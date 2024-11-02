import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'floating_daangn_button.state.freezed.dart';

@freezed
class FloatingButtonState with _$FloatingButtonState {
  const factory FloatingButtonState({
    @Default(false) final bool isExpanded,
    @Default(false) final bool isSmall,
    @Default(false) final bool isClassified,
    @Default(false) final bool expenseSelected,
    @Default(false) final bool incomeSelected,
    required final String selectedDate,
    required final DateTime createAt,
    final AssetType? assetType,
  }) = _FloatingButtonState;
}
