import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class GetAssetListUseCase {
  final AssetRepository _assetRepository;

  GetAssetListUseCase({required AssetRepository assetRepository}) : _assetRepository = assetRepository;

  Future<List<Asset>> execute({required List<String> assetIdList}) async {
    return await _assetRepository.getAssetList(assetIdList: assetIdList);
  }
}
