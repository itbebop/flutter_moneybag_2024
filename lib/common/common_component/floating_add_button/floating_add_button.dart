import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/category_menu.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/float_button.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/component/transaction_menu.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
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
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
