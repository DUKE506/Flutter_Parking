import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }
}
