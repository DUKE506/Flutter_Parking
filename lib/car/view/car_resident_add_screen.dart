import 'package:flutter/material.dart';
import 'package:flutter_parking/common/component/custom_elevated_button.dart';
import 'package:flutter_parking/common/component/custom_input_image.dart';
import 'package:flutter_parking/common/component/custom_text_field.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';

class CarResidentAddScreen extends StatelessWidget {
  const CarResidentAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '입주민차량 등록',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              CustomTextField(label: '이름', hintText: '이름을 입력하세요'),
              CustomTextField(label: '차량번호', hintText: '차량번호를 입력하세요'),
              CustomTextField(label: '전화번호', hintText: '전화번호를 입력하세요'),
              CustomTextField(
                label: '우편번호',
                hintText: '우편번호를 입력하세요',
                onPressed: () {},
              ),
              CustomTextField(label: '주소', hintText: '주소를 입력하세요'),
              CustomTextField(label: '상세주소', hintText: '상세주소를 입력하세요'),
              CustomInputImage(),
              CustomElevatedButton(onPressed: () {}, label: '등록')
            ],
          ),
        ),
      ),
    );
  }
}
