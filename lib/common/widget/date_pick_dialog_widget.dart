import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/widget/custom_button.dart';

class DatePickDialogWidget {
  static Future<void> showCustomDialog({
    required BuildContext context,
    required String title,
    required Function action,
    bool barrierDismissible = false,
  }) {
    return showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 350.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 250.h,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      dateOrder: DatePickerDateOrder.ymd,
                      // use24hFormat: true,
                      // This shows day of week alongside day of month
                      // showDayOfWeek: true,
                      // This is called when the user changes the date.
                      onDateTimeChanged: (DateTime newDate) {
                        action(newDate);
                      },
                    ),
                  ),
                  SizedBox(height: 16.w),
                  Tap(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CustomButton(
                      name: '확인',
                      buttonColor: UiConfig.buttonColor,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
