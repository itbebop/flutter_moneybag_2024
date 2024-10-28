import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_new.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_update.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class AssetScreen extends ConsumerStatefulWidget {
  const AssetScreen({super.key});

  @override
  ConsumerState<AssetScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<AssetScreen> {
  final textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final titleNewController = TextEditingController();
  final titleEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final assetProvider = ref.watch(assetStateProvier);
    final userState = ref.watch(userStateProvider);
    return Material(
      child: Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),

                      shrinkWrap: true, // ListView의 크기를 제한
                      itemCount: assetProvider.assetList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (!assetProvider.showAssetCardUpdate)
                              Dismissible(
                                onDismissed: (direction) {
                                  ref.read(assetStateProvier.notifier).deleteAsset(assetProvider.assetList[index].assetId);
                                  ref.read(assetStateProvier.notifier).fetchAsset();
                                },
                                background: Container(
                                  color: UiConfig.deleteBackColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [SizedBox(width: 20.w), const HugeIcon(icon: HugeIcons.strokeRoundedDeleteThrow, color: UiConfig.whiteColor)],
                                  ),
                                ),
                                secondaryBackground: Container(
                                  color: UiConfig.deleteBackColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const HugeIcon(icon: HugeIcons.strokeRoundedDeleteThrow, color: UiConfig.whiteColor),
                                      SizedBox(width: 20.w),
                                    ],
                                  ),
                                ),
                                key: ValueKey(assetProvider.assetList[index].assetId),
                                child: AssetCard(
                                  asset: assetProvider.assetList[index],
                                  focusNode: focusNode,
                                  index: index,
                                ),
                              ),
                            if (assetProvider.showAssetCardUpdate && assetProvider.selectedAssetCardIndex == index)
                              AssetCardUpdate(
                                asset: assetProvider.assetList[index],
                                focusNode: focusNode,
                                titleEditController: titleEditController,
                              ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                    if (assetProvider.showAssetCardNew) AssetCardNew(titleEditController: titleNewController),
                    const SizedBox(height: 16),
                    if (!assetProvider.showAssetCardNew && !assetProvider.showAssetCardUpdate)
                      AssetCardButton(
                        onTap: () {
                          ref.read(assetStateProvier.notifier).onTapAssetCardNew(true);
                          ref.read(assetStateProvier.notifier).onTapAssetCardUpdate(false);
                        },
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
            ),
          ),
        ],
      ),
    );
  }
}
