import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryListItemNew extends StatelessWidget {
  final TextEditingController categorylistCreateController;
  final AssetType assetType;

  const CategoryListItemNew({
    super.key,
    required this.assetType,
    required this.categorylistCreateController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedAddCircle,
                  color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  height: 30.h,
                  width: 150.w,
                  child: TextField(
                    controller: categorylistCreateController,
                    style: UiConfig.bodyStyle,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      isDense: true, // vertical padding 없앰
                      // border: InputBorder.none,
                      // contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
            )
          ],
        ),
      ),
    );
  }
}
