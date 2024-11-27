import 'package:flutter_moneybag_2024/domain/model/asset.dart';

abstract interface class AssetDataSource {
  Future<int> initAsset({required int userId});
  Future<int> createAsset({required Asset asset, required int userId});
  Future<List<Asset>> getAssetList({required int userId});
  Future<Asset> getAsset({required int assetId});
  Future<void> updateAsset({required Asset asset});
  Future<void> chageActivatedAsset({required int assetId, required bool isActiveAsset});
  Future<void> deleteAsset({required int assetId, required int userId});
}
