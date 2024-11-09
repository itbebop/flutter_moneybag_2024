import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryListScreen extends ConsumerWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const HugeIcon(icon: HugeIcons.strokeRoundedHome02, color: UiConfig.secondaryTextColor),
                  SizedBox(width: 8.w),
                  Text(
                    '지출',
                    style: UiConfig.h3Style.copyWith(
                      color: UiConfig.secondaryTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    const CategoryListItem(
                      assetType: AssetType.expense,
                      title: '식비',
                    ),
                    SizedBox(height: 8.h),
                    const CategoryListItem(
                      assetType: AssetType.expense,
                      title: '주거비',
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedHome02,
                    color: UiConfig.primaryColorSurface,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '수입',
                    style: UiConfig.h3Style.copyWith(
                      color: UiConfig.primaryColorSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    const CategoryListItem(
                      assetType: AssetType.income,
                      title: '급여 및 사업 소득',
                    ),
                    SizedBox(height: 8.h),
                    const CategoryListItem(
                      assetType: AssetType.income,
                      title: '금융 소득',
                    ),
                    SizedBox(height: 8.h),
                    const CategoryListItem(
                      assetType: AssetType.income,
                      title: '기타 소득',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
