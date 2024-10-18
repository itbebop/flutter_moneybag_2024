import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class AssetCardNew extends StatelessWidget {
  final TextEditingController titleEditController;
  const AssetCardNew({super.key, required this.titleEditController});

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
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              picSum(301),
              width: 30,
            ),
          ),
        ),
        Positioned(
          left: 68.w,
          top: 12.h,
          child: SizedBox(
            width: 150.w,
            height: 50.h,
            child: TextField(
              controller: titleEditController,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: UiConfig.whiteColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: UiConfig.whiteColor),
                ),
              ),
              style: const TextStyle(
                color: UiConfig.whiteColor,
                decorationThickness: 0,
              ),
            ),
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
