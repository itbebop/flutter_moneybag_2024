// Convert List<String> back to List<Color>
import 'package:flutter/material.dart';

List<Color> stringToColorList(List<String> stringList) {
  return stringList.map((colorString) => Color(int.parse(colorString.substring(1), radix: 16))).toList();
}

// Convert List<Color> to List<String>
List<String> colorToStringList(List<Color> colorList) {
  return colorList.map((color) => '#${color.value.toRadixString(16).padLeft(8, '0')}').toList();
}
