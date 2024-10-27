import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.assetType,
    required this.category,
  });

  final AssetType assetType;
  final TransactionCategory category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: UiConfig.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedMoneyBag02,
            color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
            size: 25,
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              category.name,
              style: UiConfig.smallStyle.copyWith(
                color: UiConfig.color[800],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
