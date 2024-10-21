import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropdownButton extends ConsumerWidget {
  final List<Asset> items;
  final String hints;

  const CustomDropdownButton({
    super.key,
    required this.items,
    this.hints = '선택',
  });

  // 변경: 선택된 아이템을 저장할 변수 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<Asset>(
      underline: const SizedBox.shrink(), // underline 없앰
      items: <Asset>[...items].map<DropdownMenuItem<Asset>>((asset) {
        return DropdownMenuItem<Asset>(
          value: asset,
          child: Text(asset.assetName),
        );
      }).toList(),
      onChanged: (asset) {
        if (asset != null) {
          ref.read(assetStateProvier.notifier).selectAsset(asset.assetId);
        }
      },
      hint: Text(hints),
    );
  }
}
