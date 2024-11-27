// Convert List<String> back to List<Color>
import 'package:flutter/material.dart';

// Color -> String
String colorToHexString(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0')}';
}

// String -> Color
Color hexStringToColor(String hex) {
  final buffer = StringBuffer();
  if (hex.startsWith('#')) {
    hex = hex.substring(1);
  }
  if (hex.length == 6) {
    buffer.write('FF');
  }
  buffer.write(hex);
  return Color(int.parse(buffer.toString(), radix: 16));
}
