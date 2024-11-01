import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_dropdown_button.dart';
import 'package:flutter_moneybag_2024/domain/enums/currency.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class AssetCardNew extends ConsumerWidget {
  final TextEditingController titleEditController;
  const AssetCardNew({
    super.key,
    required this.titleEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetProvider = ref.watch(assetStateProvier);

    return Stack(
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
          top: 23.h,
          child: const HugeIcon(icon: HugeIcons.strokeRoundedMoneyBag02, color: UiConfig.whiteColor),
        ),
        Positioned(
          left: 78.w,
          top: 12.h,
          child: SizedBox(
            width: 150.w,
            height: 50.h,
            child: TextField(
              controller: titleEditController,
              decoration: InputDecoration(
                hintText: '자산 이름을 입력하세요',
                hintStyle: UiConfig.smallStyle.copyWith(color: UiConfig.whiteColor),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: UiConfig.whiteColor),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: UiConfig.whiteColor),
                ),
              ),
              style: const TextStyle(
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
            width: 80.w,
            height: 34.h,
            decoration: BoxDecoration(
              color: UiConfig.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                SizedBox(width: 8.w),
                SizedBox(
                  width: 70.w,
                  child: CustomDropdownButton<Currency>(
                    action: (currency) {
                      ref.read(assetStateProvier.notifier).onSelectCurrency(currency);
                    },
                    items: Currency.values
                        .map((currency) => DropdownMenuItem<Currency>(
                              value: currency,
                              child: Text(
                                currency.currencyName,
                                style: UiConfig.extraSmallStyle,
                              ),
                            ))
                        .toList(),
                    hints: assetProvider.currencyHints,
                    hintsStyle: UiConfig.extraSmallStyle,
                    expanded: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
