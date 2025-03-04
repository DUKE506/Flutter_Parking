import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final ValueChanged<DateTime> onDateTimeChanged;
  DateTime selectDate;
  CustomDatePicker({
    super.key,
    required this.onDateTimeChanged,
    required this.selectDate,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        color: Colors.white,
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          initialDateTime: selectDate,
          minimumDate: DateTime.now().subtract(Duration(minutes: 1)),
          onDateTimeChanged: onDateTimeChanged,
          dateOrder: DatePickerDateOrder.ymd,
        ),
      ),
    );
  }
}
