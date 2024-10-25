import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetList extends ConsumerWidget {
  const AssetList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetProvider = ref.watch(assetStateProvier);
    return Column(
      children: [
        AssetItems(title: '수입', amounts: assetProvider.totalIncome),
        SizedBox(height: 16.h),
        AssetItems(title: '지출', amounts: assetProvider.totalExpense),
        SizedBox(height: 16.h),
        AssetItems(title: '잔액', amounts: assetProvider.totalAmount),
      ],
    );
  }
}
