import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/create_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_state.freezed.dart';

@freezed
class AssetState with _$AssetState {
  const factory AssetState({
    @Default([]) List<Asset> assetList,
    @Default(0) double totalAmount,
    @Default(0) double totalIncome,
    @Default(0) double totalExpense,
    @Default(0) double assetAmount,
    @Default(false) bool showAssetCardNew,
    required String userId,
    required String assetHints,
    required String assetName,
    required String assetColor,
    required String assetCurrency,
    required String currencyHints,
    required String selectedAssetId,
    required List<String> assetIdList,
    required final GetAssetListUseCase getAssetListUseCase,
    required final GetAssetUseCase getAssetUseCase,
    required final CreateAssetUseCase createAssetUserCase,
  }) = _AssetState;
}
