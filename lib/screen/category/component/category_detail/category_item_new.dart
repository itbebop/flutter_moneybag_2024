import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryItemNew extends ConsumerWidget {
  final TextEditingController categoryNameCreateController;
  final AssetType assetType;
  const CategoryItemNew({
    super.key,
    required this.assetType,
    required this.categoryNameCreateController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    return Card(
      color: UiConfig.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 20.h,
              right: 30.w,
              child: InkWell(
                onTap: () => ref.read(categoryStateProvider.notifier).showCategorySelectButton(assetType),
                child: HugeIcon(
                  icon: categoryProvider.selectedCreateIcon,
                  size: 25,
                  color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
                ),
              )),
          Positioned(
            bottom: 10.h,
            right: 17.w,
            child: SizedBox(
              width: 50.w,
              height: 30.h,
              child: TextField(
                controller: categoryNameCreateController,
                style: UiConfig.smallStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: '카테고리명',
                  hintStyle: UiConfig.extraSmallStyle.copyWith(
                    color: UiConfig.color[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
