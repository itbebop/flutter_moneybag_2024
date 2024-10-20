import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetStateProvier = StateNotifierProvider<AssetStateNotifier, AssetState>((ref) {
  final userState = ref.watch(userStateProvier);
  final List<String> assetIdList = userState.when(
    data: (user) => user.assetIdList,
    loading: () => [], // 로딩 중일 때 기본값
    error: (error, stackTrace) => [], // 에러 발생 시 기본값
  );

  return AssetStateNotifier(AssetState(assetIdList: assetIdList, getAssetListUseCase: getIt()));
});

class AssetStateNotifier extends StateNotifier<AssetState> {
  AssetStateNotifier(super.state);

  Future<void> fetchAsset() async {
    try {
      final assets = await state.getAssetListUseCase.execute(state.assetIdList);
      final asset = assets.firstWhere((a) => a.activated == true);
    } catch (error) {
      throw Exception("선택된 자산이 없습니다");
    }
  }
}
