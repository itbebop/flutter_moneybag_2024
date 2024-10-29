import 'package:flutter_moneybag_2024/domain/model/asset.dart';

abstract interface class AssetRepository {
  Future<void> createAsset({Asset? asset, required String userId});
  Future<List<Asset>> getAssetList({required List<String> assetIdList});
  Future<Asset> getAsset({required String assetId});
  Future<void> updateAsset({required Asset asset});
  Future<void> deleteAsset({required String assetId, required String userId});
}
