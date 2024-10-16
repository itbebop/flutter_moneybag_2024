import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/theme/ui_config.dart';

class SortButton extends StatelessWidget {
  final String? title;

  final Function()? onTapMore;

  const SortButton({
    super.key,
    this.title,
    this.onTapMore,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: UiConfig.h3Style.copyWith(fontWeight: UiConfig.semiBoldFont),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '최신순',
                style: UiConfig.bodyStyle.copyWith(
                  fontWeight: UiConfig.semiBoldFont,
                  color: UiConfig.black.shade700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '분류별',
                style: UiConfig.bodyStyle.copyWith(
                  fontWeight: UiConfig.semiBoldFont,
                  color: UiConfig.black.shade700,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
