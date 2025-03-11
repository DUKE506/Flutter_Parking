import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parking/car/model/car_add_resident_model.dart';
import 'package:flutter_parking/car/provider/car_provider.dart';
import 'package:flutter_parking/common/component/custom_elevated_button.dart';
import 'package:flutter_parking/common/component/custom_input_image.dart';
import 'package:flutter_parking/common/component/custom_text_field.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:flutter_parking/common/model/daum_post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CarResidentAddScreen extends ConsumerStatefulWidget {
  const CarResidentAddScreen({super.key});

  @override
  ConsumerState<CarResidentAddScreen> createState() =>
      _CarResidentAddScreenState();
}

class _CarResidentAddScreenState extends ConsumerState<CarResidentAddScreen> {
  //Form 모델
  late CarAddResidentModel residentModel = CarAddResidentModel();
  //다음 주소api 모델
  // DaumPostModelBase _post = DaumPostModelBase();
  //폼 키 - 폼 내부의 필드값들을 저장하고 validation을 진행하는데 사용
  final formKey = GlobalKey<FormState>();

  //우편번호, 주소 입력 컨트롤러
  final zoneCodeController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '입주민차량 등록',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16.0,
              children: [
                CustomTextField(
                  label: '이름',
                  hintText: '이름을 입력하세요',
                  validator: onNameValidation,
                  onSaved: (value) => residentModel.name = value,
                ),
                CustomTextField(
                  label: '모델명',
                  hintText: '모델명을 입력하세요',
                  validator: onModelNameValidation,
                  onSaved: (value) => residentModel.modelName = value,
                ),
                CustomTextField(
                  label: '차량번호',
                  hintText: '차량번호를 입력하세요',
                  validator: onCarNumberValidation,
                  onSaved: (value) => residentModel.carNumber = value,
                ),
                CustomTextField(
                  label: '전화번호',
                  hintText: '전화번호를 입력하세요',
                  validator: onPhoneNumberValidation,
                  onSaved: (value) => residentModel.phone = value,
                ),
                CustomTextField(
                  label: '우편번호',
                  hintText: '우편번호를 입력하세요',
                  controller: zoneCodeController,
                  onPressed: onPressSearchAddress,
                  readOnly: true,
                  onSaved: (value) => residentModel.zoneCode = value,
                ),
                CustomTextField(
                  label: '주소',
                  hintText: '주소를 입력하세요',
                  controller: addressController,
                  validator: onAddressValidation,
                  readOnly: true,
                  onSaved: (value) => residentModel.address = value,
                ),
                CustomTextField(
                  label: '상세주소',
                  hintText: '상세주소를 입력하세요',
                  validator: onDetailAddressValidation,
                  onSaved: (value) => residentModel.detailAddress = value,
                ),
                CustomInputImage(),
                CustomElevatedButton(
                  onPressed: () => onSavedPressed(context),
                  label: '등록',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //저장 함수
  void onSavedPressed(BuildContext context) async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      print(jsonEncode(residentModel.toJson()));
      final provider = ref
          .read(asyncResidentNotifierProvider.notifier)
          .addResidentCar(residentModel);
      context.go('/');
    } else {
      print('실패');
    }
  }

  //주소 검색 함수
  void onPressSearchAddress() async {
    HapticFeedback.mediumImpact();
    final data = await context.push('/address/search');
    //우편번호 검색 후 값이 할당 돼있을 때
    if (data is DaumPostModel) {
      setState(() {
        zoneCodeController.text = data.zonecode;
        addressController.text = data.roadAddress;
      });
    }
  }

  //저장 함수

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

  //차모델명
  String? onModelNameValidation(String? name) {
    //공백
    if (name == null || name.trim().isEmpty) {
      return '모델명을 입력해주세요!';
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

  //우편번호
  String? onZoneCodeValidation(String? zoneCode) {
    //공백
    if (zoneCode == null || zoneCode.trim().isEmpty) {
      return '우편번호를 입력해주세요!';
    }

    if (zoneCode.length != 5) {
      return '우편번호가 유효하지않습니다!';
    }

    return null;
  }

  //주소
  String? onAddressValidation(String? address) {
    //공백
    if (address == null || address.trim().isEmpty) {
      return '주소를 입력해주세요!';
    }

    if (address.length < 5) {
      return '주소가 유효하지않습니다!';
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
}
