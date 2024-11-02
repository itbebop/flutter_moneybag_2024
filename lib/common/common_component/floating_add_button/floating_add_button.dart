import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/category_menu.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_button.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/transaction_menu.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingAddButton extends ConsumerStatefulWidget {
  const FloatingAddButton({super.key});

  @override
  ConsumerState<FloatingAddButton> createState() => _FloatingAddButtonState();
}

class _FloatingAddButtonState extends ConsumerState<FloatingAddButton> {
  final memoEditController = TextEditingController();
  final amountEditController = TextEditingController();
  final assetAmountController = TextEditingController();
  final dateEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;
    final isClassified = floatingButtonState.isClassified;
    final duration = 150.ms;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(floatingButtonStateProvider.notifier).tapOutside();
          },
          child: IgnorePointer(
            ignoring: !isExpanded,
            child: AnimatedContainer(
              duration: duration,
              color: isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TransactionMenu(
                amountEditController: amountEditController,
                assetAmountController: assetAmountController,
                memoEditController: memoEditController,
                dateEditController: dateEditController,
                duration: duration,
                isClassified: isClassified,
              ),
              CategoryMenu(
                duration: duration,
                isExpanded: isExpanded,
              ),
              FloatButton(
                duration: duration,
                isExpanded: isExpanded,
                isSmall: isSmall,
                action: () {
                  ref.read(floatingButtonStateProvider.notifier).toggleCategoryMenu();
                  ref.read(floatingButtonStateProvider.notifier).quitWrite(memoEditController: memoEditController, amountEditController: amountEditController);
                  ref.read(assetStateProvier.notifier).quitWrite();
                  ref.read(categoryStateProvider.notifier).quitWrite();
                  ref.read(assetStateProvier.notifier).completeWrite(amountEditController: amountEditController, memoEditController: memoEditController);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
