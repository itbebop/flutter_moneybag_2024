import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_list_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_state.freezed.dart';

@freezed
class AssetState with _$AssetState {
  const factory AssetState({
    required List<String> assetIdList,
    required List<Asset> activatedAssetList,
    required final GetAssetListUseCase getAssetListUseCase,
  }) = _AssetState;
}
