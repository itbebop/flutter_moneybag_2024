import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_new.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final userState = ref.watch(userStateProvider);
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
                      assetColor: assetProvider.assetList[index].assetColor,
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
            if (userState.user == null)
              Column(
                children: [
                  SizedBox(height: 16.h),
                  const Text('로그인 후 이용하실 수 있습니다.'),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () => context.push('/login'),
                    child: const Text('> 로그인 페이지로 이동하기'),
                  ),
                  SizedBox(height: 32.h),
                ],
              )
          ],
        ),
      ),
    ));
  }
}
