import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';
import 'package:flutter_moneybag_2024/domain/model/dummies.dart';

class TransactionMenu extends StatelessWidget {
  const TransactionMenu({
    super.key,
    required this.duration,
    required this.isClassified,
  });

  final Duration duration;
  final bool isClassified;

  @override
  Widget build(BuildContext context) {
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
                Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 36, right: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: UiConfig.primaryColorSurface,
                  ),
                  child: Text(
                    '입력',
                    style: UiConfig.h4Style,
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
