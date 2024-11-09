import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryItemUpdate extends ConsumerWidget {
  final AssetType assetType;
  final TransactionCategory category;
  final TextEditingController categoryNameEditController;
  const CategoryItemUpdate({
    super.key,
    required this.assetType,
    required this.category,
    required this.categoryNameEditController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = ref.watch(categoryStateProvider);
    !categoryProvider.showCategoryNameFromServer ? categoryNameEditController.text = categoryProvider.updatedIconName : null;
    return Card(
      color: UiConfig.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: assetType == AssetType.income ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          if (category.categoryId == categoryProvider.selectedIconIdDelete && categoryProvider.showCategoryCardUpdate) ...[
            // Positioned(
            //   top: 5.h,
            //   left: 5.w,
            //   child: Tap(
            //     onTap: () async {
            //       await ConfirmDialogWidget.asyncInputDialog(
            //         context: context,
            //         title: '',
            //         message: '아이콘을 삭제하시겠습니까?',
            //         onConfirm: () => ref.read(categoryStateProvider.notifier).deleteTransactionCategory(category.categoryId),
            //       );
            //       ref.read(categoryStateProvider.notifier).getTransactionCategory(category.type);
            //       return AlertDialogWidget.showCustomDialog(context: context, title: '', content: '삭제되었습니다');
            //     },
            //     child: const Icon(
            //       Icons.delete_rounded,
            //       size: 20,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 5.h,
            //   right: 5.w,
            //   child: Tap(
            //     onTap: () async {
            //       if (categoryProvider.showCategoryCardUpdate) {
            //         await ConfirmDialogWidget.asyncInputDialog(
            //           context: context,
            //           title: '',
            //           message: '아이콘을 변경하시겠습니까?',
            //           onConfirm: () => ref.read(categoryStateProvider.notifier).updateTransactionCategory(
            //                 TransactionCategory(
            //                   categoryId: category.categoryId,
            //                   name: categoryNameEditController.text,
            //                   iconKey: categoryProvider.selectedIconName == '' ? category.iconKey : categoryProvider.selectedIconName,
            //                   type: category.type,
            //                 ),
            //               ),
            //         );
            //       }
            //       AlertDialogWidget.showCustomDialog(context: context, title: ' ', content: '변경되었습니다');
            //       await ref.read(categoryStateProvider.notifier).getTransactionCategory(category.type);
            //       ref.read(categoryStateProvider.notifier).cancelCategoryItemUpdate();
            //     },
            //     child: const Icon(
            //       Icons.check,
            //       size: 15,
            //     ),
            //   ),
            // ),
          ],
          Positioned(
            top: 18.h,
            right: 29.5.w,
            child: Tap(
              onTap: () => ref.read(categoryStateProvider.notifier).showCategorySelectButton(assetType),
              child: HugeIcon(
                color: UiConfig.greyColor,
                icon: categoryProvider.selectedUpdateIcon ?? iconMap[category.iconKey],
                size: 25,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                controller: categoryNameEditController,
                style: UiConfig.smallStyle,
                textAlign: TextAlign.center,
                onTap: () => ref.read(categoryStateProvider.notifier).onTapUpdateTextfield(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
