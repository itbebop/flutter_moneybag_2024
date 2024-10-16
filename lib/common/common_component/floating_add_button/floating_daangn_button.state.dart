import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'floating_daangn_button.state.freezed.dart';

@freezed
class FloatingButtonState with _$FloatingButtonState {
  const factory FloatingButtonState(
    final bool isExpanded,
    final bool isSmall,
    final bool isClassified,
    final AssetType assetType,
  ) = _FloatingButtonState;
}
