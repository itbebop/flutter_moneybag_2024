import 'package:easy_localization/easy_localization.dart';

final decimalFormat = NumberFormat.decimalPattern("en");

extension IntExt on int {
  static int? safeParse(String? source) {
    if (source == null) return null;
    return int.tryParse(source);
  }

  String toComma() {
    return decimalFormat.format(this);
  }

  String toWon() {
    return '${toComma()}원';
  }

  String get withPlusMinus {
    if (this > 0) {
      return "+$this";
    } else if (this < 0) {
      return "$this";
    } else {
      return "0";
    }
  }
}

extension DoubleExt on double {
  String toComma() {
    return decimalFormat.format(this);
  }

  String toWon() {
    return '${toComma()}원';
  }
}

// 추가: num 타입에 대한 확장
extension NumExt on num {
  String toWon() {
    return '${NumberFormat.decimalPattern("en").format(this)}원';
  }
}
