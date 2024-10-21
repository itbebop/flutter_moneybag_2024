import 'package:flutter/material.dart';

class FloatItem extends StatelessWidget {
  final String title;
  final String? imagePath;
  final Icon? icon;

  const FloatItem({super.key, required this.title, this.icon, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: imagePath != null
              ? Image.network(
                  imagePath!,
                  width: 30,
                )
              : icon,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(title),
      ],
    );
  }
}
