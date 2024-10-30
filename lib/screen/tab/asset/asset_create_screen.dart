import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/alert_dialog_widget.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_button.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_new.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/color_picker_widget.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetCreateScreen extends ConsumerStatefulWidget {
  const AssetCreateScreen({super.key});

  @override
  ConsumerState<AssetCreateScreen> createState() => _AssetCreateScreenState();
}

class _AssetCreateScreenState extends ConsumerState<AssetCreateScreen> {
  final titleEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final assetProvider = ref.watch(assetStateProvier);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AssetCardNew(
              titleEditController: titleEditController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const ColorPickerWidget(isFirst: true),
                  const ColorPickerWidget(isFirst: false),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tap(
                        onTap: () {
                          titleEditController.clear();
                        },
                        child: CustomButton(
                          name: '취 소',
                          buttonColor: UiConfig.buttonColor,
                          textStyle: UiConfig.bodyStyle.copyWith(
                            fontWeight: UiConfig.semiBoldFont,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Tap(
                        onTap: () async {
                          if (assetProvider.currencyHints == '선택') {
                            await AlertDialogWidget.showCustomDialog(
                                context: context,
                                title: '잠시만요!',
                                content: '자산에서 사용하는 화폐를 선택해주세요',
                                action: () async {
                                  await ref.read(userStateProvider.notifier).fetchUser();
                                  await ref.read(assetStateProvier.notifier).fetchAsset();
                                });
                            return;
                          }
                          ref.read(assetStateProvier.notifier).createAsset(
                                Asset(
                                  totalAmount: 0,
                                  totalIncome: 0,
                                  totalExpense: 0,
                                  assetId: '0',
                                  assetName: titleEditController.text,
                                  currency: assetProvider.currencyHints,
                                  userIdList: [],
                                  createdAt: DateTime.now(),
                                  updatedAt: DateTime.now(),
                                  assetColor: [
                                    assetProvider.firstColor.alpha,
                                    assetProvider.firstColor.red,
                                    assetProvider.firstColor.green,
                                    assetProvider.firstColor.blue,
                                    assetProvider.secondColor.alpha,
                                    assetProvider.secondColor.red,
                                    assetProvider.secondColor.green,
                                    assetProvider.secondColor.blue,
                                  ],
                                ),
                              );
                          // 이 로직이 create보다 앞으로 가면 fetchUser, Asset이 안됨..
                          await AlertDialogWidget.showCustomDialog(
                              context: context,
                              title: '자산 생성 완료!',
                              content: '${titleEditController.text}(이)가 생성되었습니다.',
                              action: () async {
                                await ref.read(userStateProvider.notifier).fetchUser();
                                await ref.read(assetStateProvier.notifier).fetchAsset();
                              });
                          Navigator.pop(context);
                        },
                        child: CustomButton(
                          name: '확 인',
                          buttonColor: UiConfig.buttonColor,
                          textStyle: UiConfig.bodyStyle.copyWith(
                            fontWeight: UiConfig.semiBoldFont,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
