import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetStateProvier = StateNotifierProvider<AssetStateNotifier, AssetState>((ref) {
  final userState = ref.watch(userStateProvider);
  List<String> assetIdList = [];
  if (userState.user != null) {
    assetIdList = userState.user!.assetIdList;
  }

  return AssetStateNotifier(AssetState(assetIdList: assetIdList, getAssetListUseCase: getIt(), getAssetUseCase: getIt(), hints: '선택', selectedAssetId: ''));
});

class AssetStateNotifier extends StateNotifier<AssetState> {
  AssetStateNotifier(super.state);

  Future<void> fetchAsset() async {
    try {
      final assetList = await state.getAssetListUseCase.execute(assetIdList: state.assetIdList);
      // assetList의 totalAmount, totalExpense, totalIncome 합산
      final double amount = assetList.fold(0, (sum, asset) => sum + asset.totalAmount);
      final double expense = assetList.fold(0, (sum, asset) => sum + asset.totalExpense);
      final double income = assetList.fold(0, (sum, asset) => sum + asset.totalIncome);

      state = state.copyWith(
        assetList: assetList,
        totalAmount: amount,
        totalExpense: expense,
        totalIncome: income,
      );
    } catch (error) {
      throw Exception("선택된 자산이 없습니다");
    }
  }

  Future<void> getAsset(String assetId) async {
    final asset = await state.getAssetUseCase.execute(assetId: assetId);
    final String hints = asset.assetName;
    final double assetAmount = asset.totalAmount; // 조회한 asset하나의 amount
    state = state.copyWith(
      hints: hints,
      assetAmount: assetAmount,
      selectedAssetId: assetId,
    );
  }

  void completeWrite({
    TextEditingController? memoEditController,
    TextEditingController? amountEditController,
  }) {
    state = state.copyWith(
      hints: '선택',
      selectedAssetId: '',
      assetAmount: 0,
    );
    if (memoEditController != null && amountEditController != null) {
      memoEditController.clear();
      amountEditController.clear();
    }
  }
}
