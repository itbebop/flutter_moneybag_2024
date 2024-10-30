import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategorySelectButton extends ConsumerStatefulWidget {
  const CategorySelectButton({super.key});

  @override
  ConsumerState<CategorySelectButton> createState() => _CategorySelectButtonState();
}

class _CategorySelectButtonState extends ConsumerState<CategorySelectButton> {
  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(categoryStateProvider);
    final isExpanded = categoryState.isExpanded;

    final duration = 150.ms;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(categoryStateProvider.notifier).tapOutside();
          },
          child: IgnorePointer(
            ignoring: !isExpanded,
            child: AnimatedContainer(
              duration: duration,
              color: isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
            ),
          ),
        ),
        Positioned(
          left: 16.w,
          bottom: 120.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: isExpanded ? 1 : 0,
                duration: duration,
                child: Container(
                  height: 500.h,
                  width: isExpanded ? MediaQuery.of(context).size.width * 0.92 : 1,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  // margin: const EdgeInsets.only(right: 15, bottom: 40),
                  decoration: BoxDecoration(
                    color: UiConfig.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // 한 줄에 4개의 아이콘 표시
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: iconMap.length,
                    itemBuilder: (context, index) {
                      // final IconData iconData = iconMap[index]['icon'];
                      // final String iconName = iconMap[index]['name'];
                      final iconKey = iconMap.keys.elementAt(index);
                      final iconData = iconMap[iconKey];

                      return InkWell(
                        onTap: () {
                          ref.read(categoryStateProvider.notifier).tapIcon(
                                assetType: categoryState.assetType,
                                selectedIconName: iconKey,
                              );
                          ref.read(categoryStateProvider.notifier).tapOutside();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HugeIcon(
                              icon: iconData,
                              size: 30,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              iconKey,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
