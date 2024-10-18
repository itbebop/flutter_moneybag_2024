import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class AssetCard extends StatelessWidget {
  const AssetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 350.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: UiConfig.primaryColorSurface,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: 28.w,
          top: 20.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.network(
              picSum(201),
              width: 40,
            ),
          ),
        ),
        Positioned(
          left: 78.w,
          top: 16.h,
          child: Text(
            'Default asset',
            style: UiConfig.h1Style.copyWith(fontWeight: UiConfig.semiBoldFont, color: UiConfig.whiteColor),
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
          right: 36.w,
          top: 16.h,
          child: Container(
            width: 58.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: UiConfig.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'KRW',
                style: UiConfig.bodyStyle.copyWith(letterSpacing: 1.0, fontWeight: UiConfig.semiBoldFont, color: UiConfig.primaryColor),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 14.h,
          left: 30.w,
          child: Text(
            '₩1800000.00',
            style: UiConfig.largeStyle.copyWith(
              color: UiConfig.whiteColor,
              fontWeight: UiConfig.semiBoldFont,
            ),
          ),
        ),
        Positioned(
          top: 88.h,
          left: 30.w,
          child: Text(
            'single/multiple',
            style: UiConfig.bodyStyle.copyWith(
              color: UiConfig.whiteColor,
              fontWeight: UiConfig.semiBoldFont,
            ),
          ),
        ),
        Positioned(
          top: 88.h,
          right: 36.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              picSum(201),
              width: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 24.h,
          right: 24.w,
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
