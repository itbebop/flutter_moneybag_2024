import 'package:flutter/material.dart';

class ConfirmDialogWidget {
  static Future<void> asyncInputDialog({required BuildContext context, required String initialName, required Function onConfirm}) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text('Title'),
              content: const Row(
                children: <Widget>[
                  Expanded(
                    child: Text('자산에 속한 개별 기록들까지 모두 삭제됩니다. 삭제하시겠습니까?'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    onConfirm();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
