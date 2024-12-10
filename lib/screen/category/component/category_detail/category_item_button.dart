import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryItemButton extends ConsumerWidget {
  final AssetType assetType;
  const CategoryItemButton({
    super.key,
    required this.assetType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: UiConfig.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          ref.read(categoryStateProvider.notifier).cancelCategoryItemUpdate();
          ref.read(categoryStateProvider.notifier).showCategoryCardNew(assetType: assetType, true);
        },
        child: Center(
          child: Icon(
            Icons.add,
            color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
          ),
        ),
      ),
    );
  }
}
