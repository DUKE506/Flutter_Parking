import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CarDetailProfileCard extends StatelessWidget {
  final String? name;
  final String number;
  final String? address;
  final String? modelName;
  final String? phone;
  final ParkingState state;

  const CarDetailProfileCard({
    super.key,
    this.name,
    required this.number,
    this.address,
    this.modelName,
    this.phone,
    required this.state,
  });

  factory CarDetailProfileCard.fromModel({required CarDetailModel model}) {
    print('카드 컴포넌트 전달받은 데이터 id : ${model.id}');
    print('카드 컴포넌트 전달받은 데이터 이름 : ${model.name}');
    print('카드 컴포넌트 전달받은 데이터 차번호 : ${model.number}');
    return CarDetailProfileCard(
      name: model.name,
      number: model.number,
      address: model.address,
      modelName: model.modelName,
      phone: model.phone,
      state: model.state,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 16.0,
        children: [
          _renderProfileItem(label: '이름', value: name),
          _renderProfileItem(label: '모델명', value: modelName),
          _renderProfileItem(label: '차량번호', value: number),
          _renderProfileItem(label: '주소', value: address),
          _renderProfileItem(label: '전화번호', value: phone),
          _renderProfileItem(
              label: '주차상태',
              value: state.KrName,
              color: state == ParkingState.IN
                  ? PRIMARY_COLOR
                  : PARKING_EXTERNAL_TEXT_COLOR),
        ],
      ),
    );
  }

  Widget _renderProfileItem({
    required String label,
    required String? value,
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: DEACTIVATE_TEXT_COLOR,
          ),
        ),
        Text(
          value ?? '',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: color ?? TEXT_COLOR,
          ),
        ),
      ],
    );
  }
}
