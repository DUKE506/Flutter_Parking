import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';

class SearchField extends StatelessWidget {
  final bool? readOnly;
  final String? hintText;
  final bool autofocus;

  const SearchField({
    super.key,
    this.autofocus = false,
    this.readOnly,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: BACKGROUND_GREY_DEEP_COLOR,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(12),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      readOnly: readOnly ?? false,
      autofocus: autofocus,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_outlined),
          prefixIconColor: DEACTIVATE_TEXT_COLOR,
          contentPadding: const EdgeInsetsDirectional.all(20.0),
          hintText: hintText,
          hintStyle: TextStyle(
            color: DEACTIVATE_TEXT_COLOR,
            fontSize: 16.0,
          ),
          filled: true,
          fillColor: Colors.white,
          border: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: readOnly == true
              ? baseBorder
              : baseBorder.copyWith(
                  borderSide: baseBorder.borderSide.copyWith(
                  color: PRIMARY_COLOR,
                ))),
    );
  }
}
