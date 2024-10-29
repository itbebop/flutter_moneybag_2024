import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_button.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_dropdown_button.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/currency.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/color_picker_widget.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class AssetCardUpdate extends ConsumerWidget {
  final TextEditingController titleEditController;
  final Asset asset;
  final FocusNode focusNode;
  const AssetCardUpdate({
    super.key,
    required this.titleEditController,
    required this.asset,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetProvider = ref.watch(assetStateProvier);

    titleEditController.text = assetProvider.assetName;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 330.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      assetProvider.firstColor,
                      assetProvider.secondColor,
                    ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                left: 44.w,
                top: 12.h,
                child: SizedBox(
                  width: 150.w,
                  height: 50.h,
                  child: TextField(
                    controller: titleEditController,
                    focusNode: focusNode,
                    onChanged: (value) => ref.read(assetStateProvier.notifier).onChangeAssetName(value),
                    decoration: InputDecoration(
                      hintStyle: UiConfig.h2Style.copyWith(color: UiConfig.whiteColor),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: UiConfig.whiteColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: UiConfig.whiteColor),
                      ),
                    ),
                    style: UiConfig.h2Style.copyWith(
                      color: UiConfig.whiteColor,
                      decorationThickness: 0,
                      fontWeight: UiConfig.semiBoldFont,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 42.w,
                top: 24.h,
                child: Container(
                  width: 76.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    color: UiConfig.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 64.w,
                        child: CustomDropdownButton<Currency>(
                          action: (currency) {
                            ref.read(assetStateProvier.notifier).onSelectCurrency(currency, assetName: titleEditController.text);
                          },
                          items: Currency.values
                              .map((currency) => DropdownMenuItem<Currency>(
                                    value: currency,
                                    child: Text(
                                      currency.currencyName,
                                      style: UiConfig.smallStyle,
                                    ),
                                  ))
                              .toList(),
                          hints: assetProvider.currencyHints,
                          hintsStyle: UiConfig.smallStyle,
                          expanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 150.h,
            width: 350.w,
            child: const ColorPickerWidget(isFirst: true),
          ),
          SizedBox(
            height: 150.h,
            width: 350.w,
            child: const ColorPickerWidget(isFirst: false),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tap(
                onTap: () => ref.read(assetStateProvier.notifier).onTapAssetCardUpdate(false),
                child: CustomButton(
                  name: '취 소',
                  buttonColor: UiConfig.buttonColor,
                  textStyle: UiConfig.extraSmallStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Tap(
                onTap: () {
                  ref.read(assetStateProvier.notifier).updateAsset(
                        Asset(
                          totalAmount: asset.totalAmount,
                          totalIncome: asset.totalIncome,
                          totalExpense: asset.totalExpense,
                          assetId: asset.assetId,
                          assetName: assetProvider.assetName,
                          currency: assetProvider.currencyHints,
                          userIdList: asset.userIdList,
                          createdAt: asset.createdAt,
                          updatedAt: DateTime.now(),
                          assetColor: [
                            assetProvider.firstColor.alpha,
                            assetProvider.firstColor.red,
                            assetProvider.firstColor.green,
                            assetProvider.firstColor.blue,
                            assetProvider.secondColor.alpha,
                            assetProvider.secondColor.red,
                            assetProvider.secondColor.green,
                            assetProvider.secondColor.blue
                          ],
                        ),
                      );
                  ref.read(assetStateProvier.notifier).fetchAsset();
                  ref.read(assetStateProvier.notifier).onTapAssetCardUpdate(false);
                  ref.read(userStateProvider.notifier).modifyColorList(assetProvider.firstColorList, assetProvider.secondColorList);
                },
                child: CustomButton(
                  name: '확 인',
                  buttonColor: UiConfig.buttonColor,
                  textStyle: UiConfig.extraSmallStyle.copyWith(
                    fontWeight: UiConfig.semiBoldFont,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
