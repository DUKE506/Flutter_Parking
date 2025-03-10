import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parking/car/model/car_add_visit_model.dart';
import 'package:flutter_parking/car/model/visit_car_add_model.dart';
import 'package:flutter_parking/car/provider/car_detail_provider.dart';
import 'package:flutter_parking/common/component/custom_input_button.dart';
import 'package:flutter_parking/common/component/custom_segment_control.dart';
import 'package:flutter_parking/common/component/custom_date_picker.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/component/custom_text_field.dart';
import 'package:flutter_parking/common/layout/bottom_sheet_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VisitBottomSheet extends ConsumerStatefulWidget {
  final String id;
  final String carNumber;
  const VisitBottomSheet({
    super.key,
    required this.id,
    required this.carNumber,
  });

  @override
  ConsumerState<VisitBottomSheet> createState() => _VisitBottomSheetState();
}

class _VisitBottomSheetState extends ConsumerState<VisitBottomSheet> {
  //방문차량 모델
  CarAddVisitModel visitModel = CarAddVisitModel();

  //방문목적 default값
  VisitPurpose purpose = VisitPurpose.values[0];
  //예상출차시간 변수
  DateTime selectDateTime = DateTime.now();
  //차량번호 입력 컨트롤러
  final carNumberInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    visitModel.id = widget.id;
    carNumberInputController.text = widget.carNumber;
  }

  //폼 키
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      height: MediaQuery.of(context).size.height / 1.4,
      title: '방문차량 등록',
      onPressed: () => onSavedPress(context),
      child: Form(
        key: formKey,
        child: _formField(),
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
          validator: onNameValidation,
          onSaved: (value) => {
            visitModel.name = value,
          },
        ),
        CustomTextField(
          label: '차량번호',
          hintText: '차량번호를 입력하세요',
          controller: carNumberInputController,
          validator: onCarNumberValidation,
          onSaved: (value) => {
            visitModel.carNumber = value,
          },
          readOnly: true,
        ),
        CustomTextField(
          label: '전화번호',
          hintText: '01012345678',
          validator: onPhoneNumberValidation,
          onSaved: (value) => {
            visitModel.phone = value,
          },
        ),
        CustomTextField(
          label: '방문지 주소',
          hintText: '방문하시는 주소를 입력해주세요',
          validator: onDetailAddressValidation,
          onSaved: (value) => {
            visitModel.detailAddress = value,
          },
        ),
        CustomSegmentControl(
          label: '방문목적',
          initialValue: visitModel.purpose!,
          keyGroup: VisitPurpose.values,
          valueGroup: VisitPurpose.values.map((p) => p.KrName).toList(),
          onValueChange: (value) => {
            setState(() {
              visitModel.purpose = value;
            })
          },
        ),
        if (purpose == VisitPurpose.Etc)
          CustomTextField(
            label: '기타',
            hintText: '방문목적을 입력하세요',
            validator: onEtcContextValidation,
            onSaved: (value) => {
              visitModel.etcContext = value,
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

  void onSavedPress(BuildContext context) {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      final provider = ref
          .read(asyncCarDetailProvider('1').notifier)
          .addVisitCar(visitModel);

      context.pop();
    } else {
      print('실패');
    }
  }

  //===============Validation================
  //이름
  String? onNameValidation(String? name) {
    //공백
    if (name == null || name.trim().isEmpty) {
      return '이름을 입력해주세요!';
    }

    //최소글자
    if (name.length < 2) {
      return '최소 2자리이상 입력해주세요!';
    }

    return null;
  }

  //차량
  String? onCarNumberValidation(String? carNumber) {
    final regex = RegExp("^\\d{2,3}[가-힣]\\d{4}\$");

    //공백
    if (carNumber == null || carNumber.trim().isEmpty) {
      return '차량번호 입력해주세요!';
    }
    if (!regex.hasMatch(carNumber)) {
      return '차량번호 형식을 확인해주세요!';
    }
    return null;
  }

  //전화번호
  String? onPhoneNumberValidation(String? phoneNumber) {
    final regex = RegExp('^01[016-9]\\d{7,8}\$');

    //공백
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return '전화번호 입력해주세요!';
    }
    if (!regex.hasMatch(phoneNumber)) {
      return '전화번호를 확인해주세요!';
    }
    return null;
  }

  //상세주소
  String? onDetailAddressValidation(String? address) {
    //공백
    if (address == null || address.trim().isEmpty) {
      return '상세주소를 입력해주세요!';
    }

    return null;
  }

  //상세주소
  String? onEtcContextValidation(String? etc) {
    //공백
    if (etc == null || etc.trim().isEmpty) {
      return '기타내용을 입력해주세요!';
    }

    return null;
  }

  //출차시간
}
