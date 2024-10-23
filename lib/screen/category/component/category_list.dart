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
                crossAxisCount: 4, // 열의 개수
                childAspectRatio: 1, // 아이템 비율
              ),
              itemCount: transactionCategories.length + 1, // '추가' 버튼을 포함하기 위해 1 증가
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedMoneyBag02,
                                color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                                size: 20,
                              ),
                              Text(category.name,
                                  style: UiConfig.bodyStyle.copyWith(
                                    color: UiConfig.color[800],
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  // '추가' 버튼
                  return Card(
                    color: UiConfig.whiteColor, // 카드 배경색을 흰색으로 변경
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                        width: 1,
                      ), // 테두리선 추가
                      borderRadius: BorderRadius.circular(15), // 모서리 둥글게
                    ),
                    child: InkWell(
                      onTap: () {
                        // 추가 버튼 클릭 시 동작
                        // 예: 카테고리 추가 화면으로 이동
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
          ),
        ],
      ),
    );
  }
}
