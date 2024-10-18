import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_state.freezed.dart';

@freezed
class AssetState with _$AssetState {
  const factory AssetState({
    required final Asset asset,
  }) = _AssetState;
}
