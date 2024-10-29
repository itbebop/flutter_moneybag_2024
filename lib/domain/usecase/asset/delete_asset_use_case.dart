import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class DeleteAssetUseCase {
  final AssetRepository _assetRepository;

  DeleteAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<void> execute({required String assetId, required String userId}) async {
    await _assetRepository.deleteAsset(assetId: assetId, userId: userId);
  }
}
