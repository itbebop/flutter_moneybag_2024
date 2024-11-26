import 'package:flutter_moneybag_2024/data/data_source/asset_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final AssetDataSource _assetDetailDataSource;

  AssetRepositoryImpl({required AssetDataSource assetDetailDataSource}) : _assetDetailDataSource = assetDetailDataSource;

  @override
  Future<void> createAsset({Asset? asset, required int userId}) async {
    await _assetDetailDataSource.createAsset(asset: asset, userId: userId);
  }

  @override
  Future<List<Asset>> getAssetList({required int userId}) async {
    return await _assetDetailDataSource.getAssetList(userId: userId);
  }

  @override
  Future<Asset> getAsset({required int assetId}) async {
    return await _assetDetailDataSource.getAsset(assetId: assetId);
  }

  @override
  Future<void> updateAsset({required Asset asset}) async {
    await _assetDetailDataSource.updateAsset(asset: asset);
  }

  @override
  Future<void> chageActivatedAsset({required int assetId, required bool isActiveAsset}) async {
    await _assetDetailDataSource.chageActivatedAsset(assetId: assetId, isActiveAsset: isActiveAsset);
  }

  @override
  Future<void> deleteAsset({required int assetId, required int userId}) async {
    await _assetDetailDataSource.deleteAsset(assetId: assetId, userId: userId);
  }
}
