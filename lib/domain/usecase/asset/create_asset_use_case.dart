import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class CreateAssetUseCase {
  final AssetRepository _assetRepository;

  CreateAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<void> execute({Asset? asset, required String userId}) async {
    await _assetRepository.createAsset(asset: asset, userId: userId);
  }
}
