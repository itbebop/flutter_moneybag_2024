import 'package:flutter_moneybag_2024/data/data_source/asset_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final AssetDataSource _assetDetailDataSource;

  AssetRepositoryImpl({required AssetDataSource assetDetailDataSource}) : _assetDetailDataSource = assetDetailDataSource;

  @override
  // Constructor
  Future<void> createAsset({Asset? asset, required String userId}) async {
    await _assetDetailDataSource.createAsset(asset: asset, userId: userId);
  }

  @override
  Future<List<Asset>> getAssetList({required List<String> assetIdList}) async {
    return await _assetDetailDataSource.getAssetList(assetIdList: assetIdList);
  }

  @override
  Future<Asset> getAsset({required String assetId}) async {
    return await _assetDetailDataSource.getAsset(assetId: assetId);
  }

  @override
  Future<void> updateAsset({required Asset asset}) async {
    await _assetDetailDataSource.updateAsset(asset: asset);
  }

  @override
  Future<void> deleteAsset({required String assetId}) async {
    await _assetDetailDataSource.deleteAsset(assetId: assetId);
  }
}
