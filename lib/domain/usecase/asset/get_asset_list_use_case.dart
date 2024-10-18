import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';

class GetAssetListUseCase {
  final AssetRepository _transactionRepository;

  GetAssetListUseCase({required AssetRepository transactionRepository}) : _transactionRepository = transactionRepository;

  Future<List<Asset>> execute(String userId, String assetId) async {
    return await _transactionRepository.getAssetList(userId: userId, assetId: assetId);
  }
}
