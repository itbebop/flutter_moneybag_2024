import 'package:flutter_moneybag_2024/domain/model/asset.dart';

abstract interface class AssetDataSource {
  Future<void> createAsset({Asset? asset, required String userId});
  Future<List<Asset>> getAssetList();
  Future<void> updateAsset({required Asset asset});
  Future<void> deleteAsset({required String assetId});
}
