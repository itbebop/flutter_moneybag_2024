import 'package:flutter_moneybag_2024/domain/model/asset.dart';

abstract interface class AssetDataSource {
  Future<void> createAsset({Asset? asset, required String userId});
  Future<List<Asset>> getAssetList({required String userId, required String assetId});
  Future<void> updateAsset({required Asset asset, required String userId});
  Future<void> deleteAsset({required String userId, required String assetId});
}