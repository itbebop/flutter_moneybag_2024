import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class AssetCard extends ConsumerWidget {
  final Asset asset;
  final int index;
  final FocusNode focusNode;
  const AssetCard({
    super.key,
    required this.asset,
    required this.index,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetColor = asset.assetColor;
    final title = asset.assetName;
    final currency = asset.currency;
    final amount = asset.totalAmount;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 330.w,
            height: 180.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(assetColor[0], assetColor[1], assetColor[2], assetColor[3]),
                Color.fromARGB(assetColor[4], assetColor[5], assetColor[6], assetColor[7]),
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
          left: 76.w,
          top: 18.h,
          child: Text(
            title,
            style: UiConfig.h2Style.copyWith(
              fontWeight: UiConfig.semiBoldFont,
              color: UiConfig.whiteColor,
            ),
          ),
        ),
        Positioned(
          top: 84.h,
          left: 26.w,
          child: Container(
            width: 320.w,
            height: 1.h,
            color: UiConfig.whiteColor,
          ),
        ),
        Positioned(
          right: 42.w,
          top: 24.h,
          child: Container(
            width: 60.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: UiConfig.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                currency,
                style: UiConfig.smallStyle.copyWith(
                  letterSpacing: 1.0,
                  // fontWeight: UiConfig.semiBoldFont,
                  color: UiConfig.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 14.h,
          left: 44.w,
          child: Text(
            amount.toString(),
            style: UiConfig.numberStyle.copyWith(
              color: UiConfig.whiteColor,
              fontWeight: UiConfig.semiBoldFont,
            ),
          ),
        ),
        Positioned(
          top: 88.h,
          left: 42.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              picSum(201),
              width: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 42.w,
          child: Tap(
            onTap: () {
              ref.read(assetStateProvier.notifier).showAssetUpdate(index);
              ref.read(assetStateProvier.notifier).getAsset(asset.assetId);
              FocusScope.of(context).requestFocus(focusNode);
              ref.read(assetStateProvier.notifier).onTapAssetCardNew(false);
            },
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedEdit02,
              color: UiConfig.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
