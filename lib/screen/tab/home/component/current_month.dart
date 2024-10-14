import 'package:flutter/material.dart';

class CurrentMonth extends StatelessWidget {
  const CurrentMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(DateTime.now().year).toString().substring(2)}년',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}
