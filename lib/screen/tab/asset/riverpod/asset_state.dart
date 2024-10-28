import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/create_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/delete_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/update_asset_use_case.dart';
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
    @Default(false) bool showAssetCardUpdate,
    @Default(0) int selectedAssetCardIndex,
    required List<Color> firstColorList,
    required List<Color> secondColorList,
    required List<String> firstColorListSave,
    required List<String> secondColorListSave,
    required Color firstColor,
    required Color secondColor,
    required String userId,
    required String assetHints,
    required String assetName,
    required List<int> assetColor,
    required String assetCurrency,
    required String currencyHints,
    required String selectedAssetId,
    required List<String> assetIdList,
    required final GetAssetListUseCase getAssetListUseCase,
    required final GetAssetUseCase getAssetUseCase,
    required final CreateAssetUseCase createAssetUserCase,
    required final UpdateAssetUseCase updateAssetUserCase,
    required final DeleteAssetUseCase deleteAssetUseCase,
  }) = _AssetState;
}
