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
                      Color.fromARGB(255, 255, 242, 206),
                      UiConfig.buttonColor,
                      Color.fromARGB(255, 250, 167, 42),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 242, 206),
                      Color.fromARGB(255, 253, 221, 132),
                      Color.fromARGB(255, 247, 172, 60),
                    ],
                  ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            AnimatedRotation(
              turns: isExpanded ? 0.125 : 0,
              duration: duration,
              child: const Icon(
                Icons.add,
                color: UiConfig.whiteColor,
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
