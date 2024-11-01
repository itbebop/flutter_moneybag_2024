import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/confirm_dialog_widget.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_button.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_update.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/color_picker_widget.dart';
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
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(userStateProvider.notifier).fetchUser();
      await ref.read(assetStateProvier.notifier).fetchAsset();
    });
  }

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
                    assetProvider.isLoading
                        ? Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                              const Center(child: CircularProgressIndicator()),
                            ],
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true, // ListView의 크기를 제한
                            itemCount: assetProvider.assetList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (!assetProvider.showAssetCardUpdate)
                                    Dismissible(
                                      confirmDismiss: (direction) async {
                                        await ConfirmDialogWidget.asyncInputDialog(
                                            context: context,
                                            title: '',
                                            message: '자산에 속한 개별 기록들까지 모두 삭제됩니다. 삭제하시겠습니까?',
                                            onConfirm: () async {
                                              await ref.read(assetStateProvier.notifier).deleteAsset(assetProvider.assetList[index].assetId);
                                              await ref.read(userStateProvider.notifier).fetchUser();
                                              await ref.read(assetStateProvier.notifier).fetchAsset();
                                            });

                                        return null;
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
                                    Column(
                                      children: [
                                        AssetCardUpdate(
                                          asset: assetProvider.assetList[index],
                                          focusNode: focusNode,
                                          titleEditController: titleEditController,
                                        ),
                                        SizedBox(height: 16.h),
                                        const ColorPickerWidget(isFirst: true),
                                        const ColorPickerWidget(isFirst: false),
                                        SizedBox(height: 16.h),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Tap(
                                              onTap: () {
                                                ConfirmDialogWidget.asyncInputDialog(
                                                  context: context,
                                                  message: '수정을 취소하시겠습니까?',
                                                  title: '',
                                                  onConfirm: () => ref.read(assetStateProvier.notifier).onTapAssetCardUpdate(false),
                                                );
                                              },
                                              child: CustomButton(
                                                name: '취 소',
                                                buttonColor: UiConfig.buttonColor,
                                                textStyle: UiConfig.extraSmallStyle.copyWith(
                                                  fontWeight: UiConfig.semiBoldFont,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.w),
                                            Tap(
                                              onTap: () async {
                                                await ConfirmDialogWidget.asyncInputDialog(
                                                  context: context,
                                                  message: '수정하시겠습니까?',
                                                  title: '',
                                                  onConfirm: () => ref.read(assetStateProvier.notifier).updateAsset(
                                                        Asset(
                                                          totalAmount: assetProvider.assetList[index].totalAmount,
                                                          totalIncome: assetProvider.assetList[index].totalIncome,
                                                          totalExpense: assetProvider.assetList[index].totalExpense,
                                                          assetId: assetProvider.assetList[index].assetId,
                                                          assetName: titleEditController.text,
                                                          currency: assetProvider.currencyHints,
                                                          userIdList: assetProvider.assetList[index].userIdList,
                                                          createdAt: assetProvider.assetList[index].createdAt,
                                                          updatedAt: DateTime.now(),
                                                          assetColor: [
                                                            assetProvider.firstColor.alpha,
                                                            assetProvider.firstColor.red,
                                                            assetProvider.firstColor.green,
                                                            assetProvider.firstColor.blue,
                                                            assetProvider.secondColor.alpha,
                                                            assetProvider.secondColor.red,
                                                            assetProvider.secondColor.green,
                                                            assetProvider.secondColor.blue
                                                          ],
                                                        ),
                                                      ),
                                                );
                                                ref.read(assetStateProvier.notifier).fetchAsset();
                                                ref.read(assetStateProvier.notifier).onTapAssetCardUpdate(false);
                                                ref.read(userStateProvider.notifier).modifyColorList(assetProvider.firstColorList, assetProvider.secondColorList);
                                              },
                                              child: CustomButton(
                                                name: '확 인',
                                                buttonColor: UiConfig.buttonColor,
                                                textStyle: UiConfig.extraSmallStyle.copyWith(
                                                  fontWeight: UiConfig.semiBoldFont,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  const SizedBox(height: 16),
                                ],
                              );
                            },
                          ),
                    const SizedBox(height: 16),
                    if (!assetProvider.showAssetCardUpdate && !assetProvider.isLoading)
                      AssetCardButton(
                        onTap: () {
                          context.push('/asset_create');
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
                      ),
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
