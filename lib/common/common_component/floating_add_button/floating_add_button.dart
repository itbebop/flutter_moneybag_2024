import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_item.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/domain/model/dummies.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingAddButton extends ConsumerWidget {
  FloatingAddButton({super.key});
  final duration = 150.ms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;
    final isClassified = floatingButtonState.isClassified;

    final textEditController = TextEditingController();
    return Stack(
      children: [
        IgnorePointer(
          ignoring: !isExpanded,
          child: AnimatedContainer(
            duration: duration,
            color: isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedOpacity(
                duration: duration,
                opacity: isExpanded ? 1 : 0,
                child: Container(
                  width: isExpanded ? 160 : 1,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 15, bottom: 10),
                  decoration: BoxDecoration(
                    color: UiConfig.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      FloatItem(title: '수입', imagePath: picSum(401), ref: ref),
                      const SizedBox(height: 8),
                      FloatItem(title: '지출', imagePath: picSum(404), ref: ref),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h, right: MediaQuery.of(context).size.width * 0.43),
                child: Tap(
                  onTap: () {
                    ref.read(floatingButtonStateProvider.notifier).toggleCategoryMenu(); // button이 눌러진 것만 알려주고 로직은 따로
                  },
                  child: AnimatedContainer(
                    duration: duration,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      // color: isExpanded ? UiConfig.backgroundColor : UiConfig.buttonColor,
                      gradient: !isExpanded
                          ? const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                UiConfig.whiteColor,
                                UiConfig.buttonColor,
                                UiConfig.primaryColorSurface,
                              ],
                            )
                          : const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                UiConfig.backgroundColor,
                                UiConfig.backgroundColor,
                              ],
                            ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      AnimatedRotation(
                        turns: isExpanded ? 0.125 : 0,
                        duration: duration,
                        child: Icon(
                          Icons.add,
                          color: isExpanded ? Colors.black : UiConfig.whiteColor,
                        ),
                      ),
                      AnimatedWidthCollapse(
                        visible: !isSmall,
                        duration: duration,
                        child: const Text(
                          '',
                          style: TextStyle(color: UiConfig.whiteColor),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedOpacity(
                duration: duration,
                opacity: isClassified ? 1 : 0,
                child: Container(
                  width: isClassified ? MediaQuery.of(context).size.width * 0.8 : 1,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 15, bottom: 220),
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
                          textAlignVertical: TextAlignVertical.bottom,
                          style: const TextStyle(color: Colors.white),
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
                                    ref: ref,
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
                          textAlignVertical: TextAlignVertical.bottom,
                          style: const TextStyle(color: Colors.white),
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
          ),
        ),

        // const Align(alignment: Alignment.center, child: CalculatorWidget()),
      ],
    );
  }
}
