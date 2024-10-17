import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/dummies.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TransactionMenu extends ConsumerWidget {
  const TransactionMenu({
    super.key,
    required this.duration,
    required this.isClassified,
  });

  final Duration duration;
  final bool isClassified;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double amount = 0.0;
    final userState = ref.watch(userStateProvier);
    final memoEditController = TextEditingController();
    final amountEditController = TextEditingController();

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
                  child: TextFormField(
                    controller: amountEditController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // FilteringTextInputFormatter.digitsOnly,
                      ThousandCommaInputFormatter(),
                    ],
                    onChanged: (value) {
                      String newValue = value.replaceAll(',', '');
                      amount = double.parse(newValue); // double로 변환
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
                            width: 100,
                            child: FloatItem(
                              title: transaction1.title,
                              imagePath: transaction1.category.imgUrl,
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
                    await ref.read(userStateProvier.notifier).fetchUser();
                    if (userState.value != null) {
                      ref.read(transactionStateProvider.notifier).createTransaction(TransactionDetail(
                          transactionId: '${userState.value!.userId}_${idDateFormat.format(DateTime.now())}',
                          title: memoEditController.text,
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                          amount: amount,
                          userId: [userState.value!.userId],
                          category: TransactionCategory(id: '1', name: '이자', type: AssetType.income, imgUrl: picSum(201), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1')));
                    } else {
                      // TODO: 스낵바 띄우기
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 36, right: 36),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: UiConfig.primaryColorSurface,
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

String thousandComma(dynamic val, {String defaultVal = ""}) {
  NumberFormat numberFormat = NumberFormat('#,###', "ko_KR");
  if (val != null && val != "") {
    if (val is int || val is double) {
      return numberFormat.format(val);
    } else if (double.tryParse(val) != null) {
      return numberFormat.format(double.parse(val));
    } else if (int.tryParse(val) != null) {
      return numberFormat.format(int.parse(val));
    }
  }

  return defaultVal;
}

class ThousandCommaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String oldNum = oldValue.text.replaceAll(",", "");
    String newNum = newValue.text.replaceAll(",", "");

    String newText = thousandComma(newValue.text, defaultVal: "0");

    // 다음 커서 위치 잡기
    int selectionIndex = ((newValue.text.length - 1) / 3).floor() // 전체 ,(comma)의 수
        -
        (((newValue.text.length - newValue.selection.end) - 1) / 3).floor() //현재 커서 위치를 기준으로 오른쪽에 있는 ,(comma)의 수
        +
        newValue.selection.end;

    if (selectionIndex > newText.length) {
      selectionIndex = newText.length;
    }

    if (oldNum == newNum) {
      //,(comma) 뒤에 커서놓고 삭제 시
      //1,234,567에서 4,뒤(커서 위치 6)에서 삭제하면 123,567이 되므로 1뒤의 ,와 4가 같이 없어져서 커서 위치가 2만큼 왼쪽으로 이동해야 한다. (최종 커서 위치 4가 되야함)
      //98,765에서 8,뒤(커서 위치 3)에서 삭제하면 9,765가 되므로 8만 없어져서 커서 위치가 1만큼 왼쪽으로 이동해야 한다. (최종 커서 위치 2가 되야함)
      selectionIndex = selectionIndex - (newText.replaceAll(",", "").length % 3 == 1 ? 2 : 1);
      newText = newValue.text.substring(0, newValue.selection.end - 1) + newValue.text.substring(newValue.selection.end);
      newText = thousandComma(newText, defaultVal: "0");
    }

    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: selectionIndex));
  }
}
