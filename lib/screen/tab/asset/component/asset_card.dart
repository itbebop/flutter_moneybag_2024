import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:hugeicons/hugeicons.dart';

class AssetCard extends StatelessWidget {
  final String title;
  final String amount;
  final String currency;
  const AssetCard({
    super.key,
    required this.title,
    required this.amount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 330.w,
            height: 180.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0xFFECB159),
                Color(0xFFFFC527),
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
                  color: UiConfig.primaryColor,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 14.h,
          left: 44.w,
          child: Text(
            amount,
            style: UiConfig.numberStyle.copyWith(
              color: UiConfig.whiteColor,
              fontWeight: UiConfig.semiBoldFont,
            ),
          ),
        ),
        Positioned(
          top: 88.h,
          left: 50.w,
          child: Text(
            'single/multiple',
            style: UiConfig.bodyStyle.copyWith(
              color: UiConfig.whiteColor,
              // fontWeight: UiConfig.semiBoldFont,
            ),
          ),
        ),
        Positioned(
          top: 88.h,
          right: 42.w,
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
          right: 34.w,
          child: Tap(
              onTap: () {}, // TODO: 수정/삭제(팝업), 색 변경
              child: const Icon(
                Icons.more_vert,
                color: UiConfig.whiteColor,
              )),
        ),
      ],
    );
  }
}
