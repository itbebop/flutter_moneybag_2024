import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandCommaInputFormatter extends TextInputFormatter {
  String thousandComma(dynamic val, {String defaultVal = ""}) {
    NumberFormat numberFormat = NumberFormat('#,###', "ko_KR");
    if (val != null && val != "") {
      if (val is int || val is double) {
        return numberFormat.format(val);
      } else if (double.tryParse(val) != null) {
        return numberFormat.format(double.parse(val));
      } else if (int.tryParse(val) != null) {
        return numberFormat.format(int.parse(val));
      }
    }

    return defaultVal;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String oldNum = oldValue.text.replaceAll(",", "");
    String newNum = newValue.text.replaceAll(",", "");

    String newText = thousandComma(newNum, defaultVal: "0");

    // 전체 텍스트에서 comma를 추가하는 계산 로직
    int selectionIndex = newText.length - (newNum.length - newValue.selection.end);

    // 커서 위치가 텍스트 길이를 초과하는 경우 방지
    if (selectionIndex > newText.length) {
      selectionIndex = newText.length;
    }

    if (oldNum == newNum) {
      // 커서를 기준으로 텍스트 수정 시 선택 위치를 업데이트
      selectionIndex = selectionIndex - (newText.replaceAll(",", "").length % 3 == 1 ? 2 : 1);
      newText = newValue.text.substring(0, newValue.selection.end - 1) + newValue.text.substring(newValue.selection.end);
      newText = thousandComma(newText, defaultVal: "0");
    }

    // 수정된 텍스트와 커서 위치 반환
    return newValue.copyWith(text: newText, selection: TextSelection.collapsed(offset: selectionIndex));
  }
}
