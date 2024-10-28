import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_update.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetUpdateScreen extends ConsumerStatefulWidget {
  const AssetUpdateScreen({super.key});

  @override
  ConsumerState<AssetUpdateScreen> createState() => _AssetUpdateScreenState();
}

class _AssetUpdateScreenState extends ConsumerState<AssetUpdateScreen> {
  FocusNode focusNode = FocusNode();
  final titleEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final assetProvider = ref.watch(assetStateProvier);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          AssetCardUpdate(
            asset: assetProvider.assetList[assetProvider.selectedAssetCardIndex],
            focusNode: focusNode,
            titleEditController: titleEditController,
          ),
        ],
      ),
    );
  }
}
