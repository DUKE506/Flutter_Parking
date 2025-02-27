import 'package:flutter/cupertino.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CustomInputButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String label;
  final String valueLabel;
  const CustomInputButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.valueLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
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
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: BACKGROUND_GREY_LIGHT_COLOR,
              ),
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text(
                valueLabel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
