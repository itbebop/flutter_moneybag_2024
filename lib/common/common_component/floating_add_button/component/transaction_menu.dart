import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/common/dart/extension/thousand_comma_input_formatter.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_dropdown_button.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class TransactionMenu extends ConsumerWidget {
  final TextEditingController memoEditController;
  final TextEditingController amountEditController;
  final TextEditingController assetAmountController;

  const TransactionMenu({
    super.key,
    required this.memoEditController,
    required this.amountEditController,
    required this.assetAmountController,
    required this.duration,
    required this.isClassified,
  });

  final Duration duration;
  final bool isClassified;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // assetAmountController.text = ref.read(assetStateProvier).assetAmount.toString();
    final assetProvider = ref.watch(assetStateProvier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedOpacity(
          duration: duration,
          opacity: isClassified ? 1 : 0,
          child: Container(
            width: isClassified ? MediaQuery.of(context).size.width * 0.8 : 1,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(right: 15, bottom: 30),
            decoration: BoxDecoration(
              color: UiConfig.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 5.0, right: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UiConfig.whiteColor,
                  ),
                  child: TextField(
                    readOnly: true,
                    controller: assetAmountController,
                    textAlign: TextAlign.right,
                    inputFormatters: <TextInputFormatter>[
                      ThousandCommaInputFormatter(),
                    ],
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: const Color(0xFF075E54),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 13.0),
                      prefixIcon: Container(
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(color: Colors.black38)),
                          ),
                          child: SizedBox(
                            width: 90.w,
                            child: Row(
                              children: [
                                SizedBox(width: 10.w),
                                CustomDropdownButton<Asset>(
                                  items: assetProvider.assetList
                                      .map<DropdownMenuItem<Asset>>((asset) => DropdownMenuItem<Asset>(
                                            value: asset,
                                            child: Text(asset.assetName),
                                          ))
                                      .toList(),
                                  hints: assetProvider.hints, // 힌트 텍스트
                                  action: (asset) => ref.read(assetStateProvier.notifier).getAsset(asset.assetId), // Asset 선택 시 호출되는 액션
                                ),
                              ],
                            ),
                          )),
                      border: InputBorder.none,
                      hintText: '자산을 선택하세요.',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 5.0, right: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UiConfig.whiteColor,
                  ),
                  child: TextField(
                    controller: amountEditController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    inputFormatters: <TextInputFormatter>[
                      ThousandCommaInputFormatter(),
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        // 키보드를 다시 보여줌
                        SystemChannels.textInput.invokeMethod('TextInput.show');
                      }
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: const Color(0xFF075E54),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 13.0),
                      prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(color: Colors.black38)),
                          ),
                          child: SizedBox(
                            width: 90.w,
                            child: Row(
                              children: [
                                SizedBox(width: 10.w),
                                FloatItem<TransactionCategory>(
                                  title: '이자', //'transaction1.title' // TODO: 글자제한, eclips 필요함
                                  onSelect: (TransactionCategory category) {},
                                  selectedValue: const TransactionCategory(
                                    categoryId: '',
                                    imgUrl: '',
                                    name: '',
                                    type: AssetType.income,
                                  ),
                                  icon: HugeIcons.strokeRoundedLoginCircle02,
                                ),
                              ],
                            ),
                          )),
                      border: InputBorder.none,
                      hintText: '금액을 입력하세요.',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 5.0, right: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UiConfig.whiteColor,
                  ),
                  child: TextFormField(
                    controller: memoEditController,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: const Color(0xFF075E54),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 13.0),
                      prefixIcon: const Icon(
                        Icons.note_alt_outlined,
                        color: UiConfig.primaryColorSurface,
                      ),
                      border: InputBorder.none,
                      hintText: '메모',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Tap(
                  onTap: () async {
                    // ,제거하고 전송
                    final value = amountEditController.text;
                    final valueWithoutComma = value.replaceAll(',', '');
                    ref.read(transactionStateProvider.notifier).onChangeAmount(valueWithoutComma);
                    final userStateValue = ref.watch(userStateProvider);
                    if (userStateValue.user != null) {
                      await ref.read(transactionStateProvider.notifier).createTransaction(
                          transactionDetail: TransactionDetail(
                            transactionId: '1',
                            memo: memoEditController.text,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                            amount: ref.read(transactionStateProvider).amount,
                            userId: userStateValue.user!.userId,
                            category: TransactionCategory(
                              categoryId: '1',
                              name: '이자',
                              type: ref.read(transactionStateProvider).assetType,
                              imgUrl: picSum(201),
                            ),
                          ),
                          assetId: assetProvider.selectedAssetId);
                    }
                    // 입력을 완료하면 키보드를 숨김
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    // write tap 닫기
                    ref.read(floatingButtonStateProvider.notifier).tapOutside();
                    // asset data 다시 로드
                    ref.read(assetStateProvier.notifier).fetchAsset();
                    // 입력창 비우기
                    ref.read(assetStateProvier.notifier).completeWrite(amountEditController: amountEditController, memoEditController: memoEditController);
                    // transaction data 다시 가져옴
                    ref.read(transactionStateProvider.notifier).fetchEventsForDay(DateTime.now());
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 36, right: 36),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: UiConfig.buttonColor,
                    ),
                    child: Text(
                      '입력',
                      style: UiConfig.h4Style,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
