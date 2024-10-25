import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/category_screen.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../common/common.dart';

class CategoryList extends StatelessWidget {
  final String title;
  final IconData icon;
  final AssetType assetType;

  const CategoryList({
    super.key,
    required this.title,
    required this.assetType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              HugeIcon(
                icon: icon,
                color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                size: 30,
              ),
              SizedBox(width: 8.w),
              Text(
                '$title 카테고리(20)',
                style: UiConfig.h1Style.copyWith(
                  color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                  fontWeight: UiConfig.semiBoldFont,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // TransactionCategory 타입의 GridView.builder 추가
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
              ),
              itemCount: transactionCategories.length + 1,
              itemBuilder: (context, index) {
                if (index < transactionCategories.length) {
                  final category = transactionCategories[index];
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
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            category.name,
                            style: UiConfig.bodyStyle.copyWith(
                              color: UiConfig.color[800],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Card(
                    color: UiConfig.whiteColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        // 추가 버튼 클릭 시 동작
                      },
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
