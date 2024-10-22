import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropdownButton<T> extends ConsumerWidget {
  final List<DropdownMenuItem<T>> items;
  final String hints;
  final Function(T) action;

  const CustomDropdownButton({
    super.key,
    required this.action,
    required this.items,
    this.hints = '선택',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<T>(
      underline: const SizedBox.shrink(), // underline 없앰
      items: items,
      onChanged: (item) {
        if (item != null) {
          action(item);
        }
      },
      hint: Text(hints),
    );
  }
}
