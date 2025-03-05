import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPressed;
  final String? buttonLabel;
  final FormFieldSetter<String> onSaved;
  final bool? readOnly;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.onSaved,
    this.validator,
    this.initialValue,
    this.onPressed,
    this.buttonLabel = '검색',
    this.readOnly = false,
    this.controller,
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
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: renderTextFormField(),
            ),
            if (onPressed != null) renderButton(),
          ],
        ),
      ],
    );
  }

  //텍스트 영역
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
      controller: controller,
      style: TextStyle(fontSize: 14.0),
      cursorColor: PRIMARY_COLOR,
      onSaved: onSaved,
      validator: validator ?? null,
      readOnly: readOnly ?? false,
    );
  }

  //버튼 영역
  Widget renderButton() {
    return IntrinsicHeight(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonLabel!,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
