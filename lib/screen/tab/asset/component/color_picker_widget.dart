import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class ColorPickerWidget extends ConsumerWidget {
  final bool isFirst;
  final ExpansionTileController expansionTileController;

  const ColorPickerWidget({
    super.key,
    required this.isFirst,
    required this.expansionTileController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstColorList = ref.watch(assetStateProvier).firstColorList;
    final secondColorList = ref.watch(assetStateProvier).secondColorList;
    Color selectedColor = Colors.blue;
    final selectedFirstColor = ref.watch(assetStateProvier).firstColor;
    final selectedSecondColor = ref.watch(assetStateProvier).secondColor;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: [
                if (isFirst)
                  ...firstColorList.map((color) => GestureDetector(
                        onTap: () {
                          ref.read(assetStateProvier.notifier).selectColor(color, isFirst);
                          expansionTileController.collapse();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: selectedFirstColor == color ? Colors.transparent : Colors.white,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )),

                if (!isFirst)
                  ...secondColorList.map((color) => GestureDetector(
                        onTap: () {
                          ref.read(assetStateProvier.notifier).selectColor(color, isFirst);
                          expansionTileController.collapse();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: color,
                              border: Border.all(
                                color: selectedSecondColor == color ? Colors.transparent : Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),

                // Add Color Button
                GestureDetector(
                  onTap: () {
                    ref.read(assetStateProvier.notifier).showAddDialog(context, selectedColor, isFirst);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedAdd02,
                      color: UiConfig.greyColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedDelete02,
                      color: UiConfig.greyColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
