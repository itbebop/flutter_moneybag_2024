import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_list_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetStateProvier = StateNotifierProvider<AssetStateNotifier, AsyncValue<Asset>>((ref) => AssetStateNotifier(getIt()));

class AssetStateNotifier extends StateNotifier<AsyncValue<Asset>> {
  final GetAssetListUseCase getAssetListUseCase;

  AssetStateNotifier(this.getAssetListUseCase) : super(const AsyncValue.loading());

  Future<void> fetchAsset() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 변경

      final assets = await getAssetListUseCase.execute();
      final asset = assets.firstWhere((a) => a.activated == true);
      state = AsyncValue.data(asset);
    } catch (error) {
      throw Exception("선택된 자산이 없습니다");
    }
  }
}
