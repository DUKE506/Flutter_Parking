import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/visit_car_add_model.dart';
import 'package:flutter_parking/common/component/custom_elevated_button.dart';
import 'package:flutter_parking/common/component/custom_input_button.dart';
import 'package:flutter_parking/common/component/custom_segment_control.dart';
import 'package:flutter_parking/common/component/custom_date_picker.dart';
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
  VisitPurpose purpose = VisitPurpose.values[0];
  DateTime selectDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.4,
        child: Column(
          children: [
            _renderDragHandle(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    spacing: 16.0,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '방문차량 등록',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      _formField(),
                      CustomElevatedButton(onPressed: () {}, label: '등록')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formField() {
    return Column(
      spacing: 16.0,
      children: [
        CustomTextField(
          label: '이름',
          hintText: '이름을 입력하세요',
        ),
        CustomTextField(
          label: '차량번호',
          hintText: '차량번호를 입력하세요',
          initialValue: widget.carNumber,
        ),
        CustomTextField(
          label: '전화번호',
          hintText: '01012345678',
        ),
        CustomSegmentControl(
          label: '방문목적',
          initialValue: purpose,
          keyGroup: VisitPurpose.values,
          valueGroup: VisitPurpose.values.map((p) => p.KrName).toList(),
          onValueChange: (value) => {
            setState(() {
              purpose = value;
            })
          },
        ),
        CustomInputButton(
          onTap: onTapDate,
          label: '출차예정시간',
          valueLabel:
              '${selectDateTime.year}-${selectDateTime.month}-${selectDateTime.day} ${selectDateTime.hour}:${selectDateTime.minute}',
        )
      ],
    );
  }

  //날짜 선택
  onTapDate() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CustomDatePicker(
          selectDate: selectDateTime,
          onDateTimeChanged: (value) {
            setState(() {
              selectDateTime = value;
            });
          },
        );
      },
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
