import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/home/component/asset_items.dart';

class AssetList extends StatelessWidget {
  const AssetList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssetItems(title: '수입', amounts: 3400000),
        const SizedBox(height: 16),
        AssetItems(title: '지출', amounts: 1800000),
        const SizedBox(height: 16),
        AssetItems(title: '잔액', amounts: 1600000),
      ],
    );
  }
}
