import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/floating_add_button/floating_add_button.riverpod.dart';
import 'package:flutter_moneybag_2024/screen/main_screen.dart';
import 'package:flutter_moneybag_2024/screen/tab/tab_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingAddButton extends ConsumerWidget {
  FloatingAddButton({super.key});
  final duration = 150.ms;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingButtonState = ref.watch(floatingButtonStateProvider);
    final isExpanded = floatingButtonState.isExpanded;
    final isSmall = floatingButtonState.isSmall;
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
                  width: 160,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 15, bottom: 10),
                  decoration: BoxDecoration(
                    color: UiConfig.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      _floatItem('수입', picSum(401)),
                      const SizedBox(
                        height: 8,
                      ),
                      _floatItem('지출', picSum(404)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h, right: 170.w),
                child: Tap(
                  onTap: () {
                    final currentTab = ref.read(currentTabProvider);
                    switch (currentTab) {
                      case TabItem.home:
                      case TabItem.report:
                      case TabItem.mymenu:
                    }
                    ref.read(floatingButtonStateProvider.notifier).toggleMenu(); // button이 눌러진 것만 알려주고 로직은 따로
                  },
                  child: AnimatedContainer(
                    duration: duration,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: isExpanded ? UiConfig.backgroundColor : UiConfig.secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      AnimatedRotation(
                        turns: isExpanded ? 0.125 : 0,
                        duration: duration,
                        child: Icon(
                          Icons.add,
                          color: isExpanded ? Colors.black : Colors.white,
                        ),
                      ),
                      AnimatedWidthCollapse(
                        visible: !isSmall,
                        duration: duration,
                        child: const Text(
                          '',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _floatItem(String title, String imagePath) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imagePath,
            width: 30,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title),
      ],
    );
  }
}