import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/visit_car_add_model.dart';
import 'package:flutter_parking/common/component/custom_elevated_button.dart';
import 'package:flutter_parking/common/component/custom_input_button.dart';
import 'package:flutter_parking/common/component/custom_segment_control.dart';
import 'package:flutter_parking/common/component/custom_date_picker.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/component/custom_text_field.dart';
import 'package:flutter_parking/common/layout/bottom_sheet_layout.dart';

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
    return BottomSheetLayout(
      height: MediaQuery.of(context).size.height / 1.4,
      title: '방문차량 등록',
      onPressed: () {},
      child: _formField(),
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
        CustomTextField(
          label: '방문지 주소',
          hintText: '방문하시는 주소를 입력해주세요',
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
        if (purpose == VisitPurpose.Etc)
          CustomTextField(
            label: '기타',
            hintText: '방문목적을 입력하세요',
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

  //상단 드래그 핸들링 위치 표시 위젯
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
