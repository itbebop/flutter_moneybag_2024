import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_new.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetScreen extends ConsumerStatefulWidget {
  const AssetScreen({super.key});

  @override
  ConsumerState<AssetScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<AssetScreen> {
  final textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final titleEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final assetProvider = ref.watch(assetStateProvier);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true, // ListView의 크기를 제한
              itemCount: assetProvider.assetList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AssetCard(
                      title: assetProvider.assetList[index].assetName,
                      amount: assetProvider.assetList[index].totalAmount.toWon().toString(),
                      currency: assetProvider.assetList[index].currency,
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
            if (assetProvider.showAssetCardNew) AssetCardNew(titleEditController: titleEditController),
            const SizedBox(height: 16),
            AssetCardButton(
              onTap: () => ref.read(assetStateProvier.notifier).onTapAssetCardNew(true),
            ),
          ],
        ),
      ),
    ));
  }
}
