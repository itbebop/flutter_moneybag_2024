import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class ChangeActivedAssetUseCase {
  final AssetRepository _assetRepository;

  ChangeActivedAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<void> execute({required int assetId, required bool isActiveAsset}) async {
    await _assetRepository.chageActivatedAsset(assetId: assetId, isActiveAsset: isActiveAsset);
  }
}
