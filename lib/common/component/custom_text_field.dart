import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? initialValue;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: DEACTIVATE_TEXT_COLOR,
          ),
        ),
        renderTextFormField(),
      ],
    );
  }

  Widget renderTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: BACKGROUND_GREY_LIGHT_COLOR,
        hintText: hintText,
        hintStyle: TextStyle(
          color: DEACTIVATE_TEXT_COLOR,
          fontSize: 12.0,
        ),
      ),
      initialValue: initialValue,
      style: TextStyle(fontSize: 14.0),
      cursorColor: PRIMARY_COLOR,
    );
  }
}
