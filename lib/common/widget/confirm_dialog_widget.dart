import 'package:flutter/material.dart';

class ConfirmDialogWidget {
  static Future<void> asyncInputDialog({required BuildContext context, required String initialName, required Function onConfirm}) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        String name = initialName;
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text('Title'),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: const InputDecoration(labelText: 'Team Name', hintText: 'eg. bora'),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
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
                  onPressed: () => onConfirm,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
