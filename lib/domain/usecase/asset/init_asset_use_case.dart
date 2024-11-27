import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class InitAssetUseCase {
  final AssetRepository _assetRepository;

  InitAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<int> execute({required int userId}) async {
    return await _assetRepository.initAsset(userId: userId);
  }
}
