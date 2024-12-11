import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/common/dart/extension/thousand_comma_input_formatter.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_button.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_dropdown_button.dart';
import 'package:flutter_moneybag_2024/common/widget/date_pick_dialog_widget.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class TransactionMenu extends ConsumerWidget {
  final TextEditingController memoEditController;
  final TextEditingController amountEditController;
  final TextEditingController assetAmountController;
  final TextEditingController dateEditController;

  const TransactionMenu({
    super.key,
    required this.memoEditController,
    required this.amountEditController,
    required this.assetAmountController,
    required this.dateEditController,
    required this.duration,
    required this.isClassified,
  });

  final Duration duration;
  final bool isClassified;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetProvider = ref.watch(assetStateProvier);
    final transacProvider = ref.read(transactionStateProvider);
    final categoryProvider = ref.watch(categoryStateProvider);
    final floatingAddProvider = ref.watch(floatingButtonStateProvider);
    final leftSideWidth = 150.w;
    const double rightSideRightPadding = 50.0;
    dateEditController.text = floatingAddProvider.selectedDate;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedOpacity(
          duration: duration,
          opacity: isClassified ? 1 : 0,
          child: Container(
            width: isClassified ? MediaQuery.of(context).size.width * 0.92 : 1,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(right: 15, bottom: 40),
            decoration: BoxDecoration(
              color: UiConfig.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(right: rightSideRightPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UiConfig.whiteColor,
                  ),
                  child: TextField(
                    readOnly: true,
                    controller: dateEditController,
                    textAlign: TextAlign.right,
                    inputFormatters: <TextInputFormatter>[
                      ThousandCommaInputFormatter(),
                    ],
                    textAlignVertical: TextAlignVertical.bottom,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 13.0),
                      prefixIcon: Container(
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(color: Colors.black38)),
                          ),
                          child: SizedBox(
                            width: leftSideWidth,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('날짜'),
                                  SizedBox(width: 8.w),
                                  InkWell(
                                    onTap: () => DatePickDialogWidget.showCustomDialog(
                                        context: context, title: '', action: (DateTime selectedDate) => ref.read(floatingButtonStateProvider.notifier).selectedDate(selectedDate)),
                                    child: const HugeIcon(
                                      icon: HugeIcons.strokeRoundedCalendar01,
                                      color: UiConfig.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      border: InputBorder.none,
                      hintText: '날짜를 선택하세요.',
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
                  padding: const EdgeInsets.only(right: rightSideRightPadding),
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
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 13.0),
                      prefixIcon: Container(
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(color: Colors.black38)),
                          ),
                          child: SizedBox(
                            width: leftSideWidth,
                            child: Row(
                              children: [
                                CustomDropdownButton<Asset>(
                                  items: assetProvider.allAssetList
                                      .map<DropdownMenuItem<Asset>>((asset) => DropdownMenuItem<Asset>(
                                            value: asset,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                asset.assetName,
                                                style: const TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  hints: assetProvider.assetHints, // 힌트 텍스트
                                  action: (asset) {
                                    ref.read(assetStateProvier.notifier).getAsset(asset.assetId);
                                    assetAmountController.text = '잔액  ${assetProvider.totalAmount.toWon().toString()}';
                                  }, // Asset 선택 시 호출되는 액션
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
                  padding: const EdgeInsets.only(right: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UiConfig.whiteColor,
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(right: BorderSide(color: Colors.black38)),
                        ),
                        child: SizedBox(
                          width: leftSideWidth,
                          child: CustomDropdownButton<TransactionCategory>(
                            items: categoryProvider.categoryList
                                .map<DropdownMenuItem<TransactionCategory>>((category) => DropdownMenuItem<TransactionCategory>(
                                      value: category,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          category.categoryName,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            hints: categoryProvider.categoryHints, // 힌트 텍스트
                            action: (category) {
                              ref.read(categoryStateProvider.notifier).selectCategory(selectCategory: category);
                            }, // Asset 선택 시 호출되는 액션
                          ),
                        ),
                      ),
                      CustomDropdownButton<TransactionCategory>(
                        items: categoryProvider.categoryList
                            .map<DropdownMenuItem<TransactionCategory>>((category) => DropdownMenuItem<TransactionCategory>(
                                  value: category,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      category.categoryName,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        hints: categoryProvider.categoryHints, // 힌트 텍스트
                        action: (category) {
                          ref.read(categoryStateProvider.notifier).selectCategory(selectCategory: category);
                        }, // Asset 선택 시 호출되는 액션
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // padding: const EdgeInsets.only(left: 5.0, right: rightSideRightPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: UiConfig.whiteColor,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(color: Colors.black38)),
                          ),
                          child: TextFormField(
                            controller: memoEditController,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(color: Colors.black),
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
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            controller: amountEditController,
                            keyboardType: TextInputType.number,
                            // textAlign: TextAlign.right,
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
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 13.0),
                              border: InputBorder.none,
                              hintText: '금액을 입력하세요.',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: MediaQuery.of(context).size.width * 0.038,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Tap(
                  onTap: () async {
                    // ,제거하고 전송
                    final value = amountEditController.text;
                    final valueWithoutComma = value.replaceAll(',', '');
                    ref.read(transactionStateProvider.notifier).onChangeAmount(valueWithoutComma);
                    if (ref.read(assetStateProvier.notifier).onEnterWithoutSelect(context)) {
                      return;
                    } else if (ref.read(categoryStateProvider.notifier).onEnterWithoutSelect(context)) {
                      return;
                    }

                    final userStateValue = ref.watch(userStateProvider);
                    if (userStateValue.user != null) {
                      await ref.read(transactionStateProvider.notifier).createTransaction(
                          memo: memoEditController.text,
                          amount: valueWithoutComma,
                          createAt: floatingAddProvider.createAt,
                          category: TransactionCategory(
                            categoryId: categoryProvider.category!.categoryId,
                            categoryName: categoryProvider.category!.categoryName,
                            assetType: transacProvider.assetType,
                            iconKey: categoryProvider.category!.iconKey,
                            level: 1,
                            userId: 0,
                          ),
                          assetId: assetProvider.selectedAssetId,
                          userId: userStateValue.user!.uid);
                    }
                    // 입력을 완료하면 키보드를 숨김
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    // write tap 닫기
                    ref.read(floatingButtonStateProvider.notifier).tapOutside();
                    // asset data 다시 로드
                    ref.read(assetStateProvier.notifier).fetchAsset();
                    // 입력창 비우기
                    ref.read(assetStateProvier.notifier).completeWrite(amountEditController: amountEditController, memoEditController: memoEditController);
                  },
                  child: const CustomButton(
                    name: '입력',
                    buttonColor: UiConfig.buttonColor,
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
