import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryListItem extends StatelessWidget {
  final String title;
  final AssetType assetType;
  const CategoryListItem({
    super.key,
    required this.title,
    required this.assetType,
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
            Tap(
              onTap: () => context.push('/category_detail'),
              child: Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedHome02,
                    color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    title,
                    style: UiConfig.h3Style.copyWith(
                      color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
            )
          ],
        ),
      ),
    );
  }
}
