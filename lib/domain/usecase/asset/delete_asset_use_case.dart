import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class DeleteAssetUseCase {
  final AssetRepository _assetRepository;

  DeleteAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<void> execute({required String assetId}) async {
    await _assetRepository.deleteAsset(assetId: assetId);
  }
}
