import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class GetAssetUseCase {
  final AssetRepository _assetRepository;

  GetAssetUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<Asset> execute({required String assetId}) async {
    return await _assetRepository.getAsset(assetId: assetId);
  }
}
