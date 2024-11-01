import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/color_list.dart';
import 'package:flutter_moneybag_2024/common/widget/alert_dialog_widget.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/currency.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final assetStateProvier = StateNotifierProvider<AssetStateNotifier, AssetState>((ref) {
  final userState = ref.watch(userStateProvider);
  List<String> assetIdList = [];
  String userId = '';
  List<Color> firstColorList = [];
  List<Color> secondColorList = [];
  if (userState.user != null) {
    assetIdList = userState.user!.assetIdList;
    userId = userState.user!.userId;
    if (userState.user!.firstColorListSave.isEmpty) {
      firstColorList = initColorList;
    } else {
      firstColorList = stringToColorList(userState.user!.firstColorListSave);
    }
    if (userState.user!.firstColorListSave.isEmpty) {
      secondColorList = initColorList;
    } else {
      secondColorList = stringToColorList(userState.user!.secondColorListSave);
    }
  }

  return AssetStateNotifier(AssetState(
    createAssetUserCase: getIt(),
    getAssetListUseCase: getIt(),
    updateAssetUserCase: getIt(),
    deleteAssetUseCase: getIt(),
    secondColorListSave: [],
    assetIdList: assetIdList,
    getAssetUseCase: getIt(),
    assetHints: '선택',
    currencyHints: '선택',
    selectedAssetId: '',
    assetName: '',
    assetColor: [],
    assetCurrency: '',
    userId: userId,
    firstColor: const Color.fromARGB(255, 236, 177, 89),
    secondColor: const Color.fromARGB(255, 255, 197, 39),
    firstColorList: firstColorList,
    secondColorList: secondColorList,
    firstColorListSave: [],
    assetType: AssetType.expense,
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
      state = state.copyWith(isLoading: true);
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
        isLoading: false,
      );
      // 자산이 1개인 경우에는 자동 선택
      if (assetList.length == 1) {
        getAsset(assetList.first.assetId);
      }
    } catch (error) {
      throw Exception("AssetList를 불러오지 못했습니다.");
    }
  }

  Future<void> getAsset(String assetId) async {
    final asset = await state.getAssetUseCase.execute(assetId: assetId);
    final String assetHints = asset.assetName;
    final double assetAmount = asset.totalAmount; // 조회한 asset하나의 amount
    final String assetName = asset.assetName;
    final String assetCurrency = asset.currency;
    final List<int> assetColor = asset.assetColor;
    final firstColor = Color.fromARGB(assetColor[0], assetColor[1], assetColor[2], assetColor[3]);
    final secondColor = Color.fromARGB(assetColor[4], assetColor[5], assetColor[6], assetColor[7]);
    state = state.copyWith(
      assetHints: assetHints,
      assetAmount: assetAmount,
      selectedAssetId: assetId,
      assetName: assetName,
      assetColor: assetColor,
      assetCurrency: assetCurrency,
      currencyHints: assetCurrency,
      firstColor: firstColor,
      secondColor: secondColor,
    );
  }

  void selectAssetType(AssetType assetType) {
    state = state.copyWith(assetType: assetType);
  }

  void completeWrite({TextEditingController? memoEditController, TextEditingController? amountEditController}) {
    // 자산이 1개 이상인 경우는 목록 날림
    quitWrite();

    state = state.copyWith(
      assetAmount: 0,
    );
    if (memoEditController != null && amountEditController != null) {
      memoEditController.clear();
      amountEditController.clear();
    }
  }

  void quitWrite() {
    state = state.copyWith(
      assetHints: '선택',
      selectedAssetId: '',
    );
  }

  bool onEnterWithoutSelect(BuildContext context) {
    bool result = false;
    if (state.selectedAssetId == '') {
      AlertDialogWidget.showCustomDialog(context: context, title: '', content: '자산을 선택해주세요');
      result = true;
    } else {
      getAsset(state.selectedAssetId);
    }
    return result;
  }

  void onSelectCurrency(Currency currency, {String? assetName}) {
    state = state.copyWith(
      currencyHints: currency.currencyName,
      assetName: assetName ?? state.assetName,
    );
  }

  Future<void> createAsset(Asset asset) async {
    await state.createAssetUserCase.execute(asset: asset, userId: state.userId);
    state = state.copyWith(
      firstColor: const Color.fromARGB(255, 236, 177, 89),
      secondColor: const Color.fromARGB(255, 255, 197, 39),
    );
  }

  Future<void> updateAsset(Asset asset) async {
    await state.updateAssetUserCase.execute(asset: asset, assetId: asset.assetId);
  }

  void showAssetUpdate(int selectedAssetCardIndex) {
    state = state.copyWith(
      showAssetCardUpdate: true,
      selectedAssetCardIndex: selectedAssetCardIndex,
      currencyHints: state.assetList[selectedAssetCardIndex].currency,
    );
  }

  void onTapAssetCardUpdate(bool showUpdate) {
    state = state.copyWith(
      showAssetCardUpdate: showUpdate,
      showAssetCardUpdateName: false,
    );
  }

  // void onChangeAssetName(String assetName) {
  //   state = state.copyWith(assetName: assetName);
  // }

  void onTapUpdateTextField() {
    state = state.copyWith(
      showAssetCardUpdateName: true,
    );
  }

  void selectColor(Color color, bool isFirst) {
    if (isFirst) {
      state = state.copyWith(firstColor: color);
    } else {
      state = state.copyWith(secondColor: color);
    }
  }

  void showAddDialog(BuildContext context, Color selectedColor, bool isFirst) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: (newColor) {
              selectedColor = newColor;
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Add Color'),
            onPressed: () {
              addColor(selectedColor, isFirst);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void addColor(Color color, bool isFirst) {
    if (isFirst) {
      state = state.copyWith(firstColorList: [...state.firstColorList, color]);
    } else {
      state = state.copyWith(secondColorList: [...state.secondColorList, color]);
    }
  }

  void removeColor(Color color, bool isFirst) {
    if (isFirst) {
      List<Color> firstUpdatedList = state.firstColorList;
      firstUpdatedList.remove(color);
      state = state.copyWith(firstColorList: [...firstUpdatedList, color]);
    } else {
      List<Color> secondUpdatedList = state.secondColorList;
      secondUpdatedList.remove(color);
      state = state.copyWith(secondColorList: [...secondUpdatedList, color]);
    }
  }

  Future<void> deleteAsset(String assetId) async {
    try {
      state = state.copyWith(isLoading: true);
      await state.deleteAssetUseCase.execute(assetId: assetId, userId: state.userId);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      rethrow;
    }
  }
}
