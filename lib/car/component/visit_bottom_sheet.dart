import 'package:flutter/material.dart';
import 'package:flutter_parking/common/component/custom_elevated_button.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/component/custom_text_field.dart';

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
      height: MediaQuery.of(context).size.height / 1.4,
      child: Column(
        children: [
          _renderDragHandle(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '방문차량 등록',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                CustomTextField(
                  label: '이름',
                  hintText: '아이디를 입력하세요',
                ),
                CustomTextField(
                  label: '차량번호',
                  hintText: '차량번호를 입력하세요',
                ),
                CustomTextField(
                  label: '전화번호',
                  hintText: '010-0000-0000',
                ),
                CustomElevatedButton(onPressed: () {}, label: '등록')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderDragHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        color: BACKGROUND_GREY_DEEP_COLOR,
        height: 4,
        width: MediaQuery.of(context).size.width / 5,
      ),
    );
  }
}
