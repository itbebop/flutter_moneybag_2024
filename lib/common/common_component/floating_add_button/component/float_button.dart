import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    super.key,
    required this.duration,
    required this.isExpanded,
    required this.isSmall,
    required this.action,
  });

  final Duration duration;
  final bool isExpanded;
  final bool isSmall;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h, right: MediaQuery.of(context).size.width * 0.43),
      child: Tap(
        onTap: () {
          action();
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
    );
  }
}