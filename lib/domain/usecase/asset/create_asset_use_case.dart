import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class CreateAssetUseCase {
  final AssetRepository _assetRepository;

  CreateAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<int> execute({required Asset asset, required int userId}) async {
    return await _assetRepository.createAsset(asset: asset, userId: userId);
  }
}
