import 'package:flutter/material.dart';

class VisitBottomSheet extends StatefulWidget {
  final String carNumber;
  const VisitBottomSheet({
    super.key,
    required this.carNumber,
  });

  @override
  State<VisitBottomSheet> createState() => _VisitBottomSheetState();
}

class _VisitBottomSheetState extends State<VisitBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        height: 700,
        child: Text('바텀시트'),
      ),
    );
  }
}
