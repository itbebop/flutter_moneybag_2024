import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/widget/dialog_widget.dart';
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

  return AssetStateNotifier(AssetState(
    assetIdList: assetIdList,
    getAssetListUseCase: getIt(),
    getAssetUseCase: getIt(),
    hints: '선택',
    selectedAssetId: '',
  ));
});

class AssetStateNotifier extends StateNotifier<AssetState> {
  AssetStateNotifier(super.state);

  void logout() {
    state = state.copyWith(
      totalAmount: 0,
      totalExpense: 0,
      totalIncome: 0,
    );
  }

  Future<void> fetchAsset() async {
    try {
      // 전체 assetList 가져옴
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
      // 자산이 1개인 경우에는 자동 선택
      if (assetList.length == 1) {
        getAsset(assetList.first.assetId);
      }
    } catch (error) {
      throw Exception("선택된 자산이 없습니다");
    }
  }

  Future<void> getAsset(String assetId) async {
    final asset = await state.getAssetUseCase.execute(assetId: assetId);
    final String leftHints = asset.assetName;
    final double assetAmount = asset.totalAmount; // 조회한 asset하나의 amount
    state = state.copyWith(
      hints: leftHints,
      assetAmount: assetAmount,
      selectedAssetId: assetId,
    );
  }

  void completeWrite({TextEditingController? memoEditController, TextEditingController? amountEditController}) {
    // 자산이 1개 이상인 경우는 목록 날림
    if (state.assetList.length > 1) {
      state = state.copyWith(
        hints: '선택',
        selectedAssetId: '',
      );
    }

    state = state.copyWith(
      assetAmount: 0,
    );
    if (memoEditController != null && amountEditController != null) {
      memoEditController.clear();
      amountEditController.clear();
    }
  }

  void onEnterWithoutSelect(BuildContext context) {
    DialogWidget.showCustomDialog(context: context, title: '필수선택', content: '자산을 선택해주세요');
    if (state.selectedAssetId == '') {
      DialogWidget.showCustomDialog(context: context, title: '', content: '자산을 선택해주세요');
    }
  }
}
