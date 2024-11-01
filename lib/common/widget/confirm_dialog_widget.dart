import 'package:flutter/material.dart';

class ConfirmDialogWidget {
  static Future<void> asyncInputDialog({required BuildContext context, required String message, required String title, required Function onConfirm}) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: Text(title),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(message),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('취소'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('확인'),
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
