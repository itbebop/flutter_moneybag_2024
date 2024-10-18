import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class AssetCardButton extends StatelessWidget {
  const AssetCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: UiConfig.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3,
          color: UiConfig.primaryColorSurface,
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.add_circle_outline_outlined,
          color: UiConfig.primaryColorSurface,
          size: 60,
        ),
      ),
    );
  }
}
