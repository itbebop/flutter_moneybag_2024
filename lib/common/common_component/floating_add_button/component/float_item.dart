import 'package:flutter/material.dart';

class FloatItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const FloatItem({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
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
