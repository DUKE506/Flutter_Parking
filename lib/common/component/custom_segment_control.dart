import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CustomSegmentControl<T extends Object> extends StatelessWidget {
  final String label;
  final T initialValue;
  final List<T> keyGroup;
  final List<String> valueGroup;
  final ValueChanged<T> onValueChange;

  const CustomSegmentControl({
    super.key,
    required this.label,
    required this.initialValue,
    required this.keyGroup,
    required this.valueGroup,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 4,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: DEACTIVATE_TEXT_COLOR,
          ),
        ),
        _renderSegmentControl(),
      ],
    );
  }

  Widget _renderSegmentControl() {
    return CupertinoSegmentedControl<T>(
      children: Map.fromEntries(
        List.generate(
          keyGroup.length,
          (idx) => MapEntry(
            keyGroup[idx],
            _segment(keyGroup[idx], valueGroup[idx]),
          ),
        ),
      ),
      borderColor: PRIMARY_COLOR,
      selectedColor: PRIMARY_COLOR,
      // unselectedColor: BACKGROUND_GREY_LIGHT_COLOR,
      pressedColor: PRIMARY_COLOR,
      groupValue: initialValue,
      onValueChanged: onValueChange,
      padding: EdgeInsets.all(0),
    );
  }

  Widget _segment(T key, String label) {
    final isSelected = key.toString() == initialValue.toString();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : DEACTIVATE_TEXT_COLOR,
        ),
      ),
    );
  }
}
