import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:hugeicons/hugeicons.dart';

class AssetCardButton extends StatelessWidget {
  final Function() onTap;
  const AssetCardButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 180.h,
      decoration: BoxDecoration(
        color: UiConfig.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: UiConfig.primaryColorSurface,
        ),
      ),
      child: InkWell(onTap: onTap, child: const HugeIcon(icon: HugeIcons.strokeRoundedAddCircleHalfDot, color: UiConfig.primaryColorSurface)),
    );
  }
}
