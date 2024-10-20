import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class UpdateAssetUseCase {
  final AssetRepository _assetRepository;

  UpdateAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<void> execute({required Asset asset, required String assetId}) async {
    await _assetRepository.updateAsset(asset: asset);
  }
}
