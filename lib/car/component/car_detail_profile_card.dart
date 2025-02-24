import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';

class CarDetailProfileCard extends StatelessWidget {
  final String? name;
  final String number;
  final String? address;
  final String? phone;
  final ParkingState state;

  const CarDetailProfileCard({
    super.key,
    this.name,
    required this.number,
    this.address,
    this.phone,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _renderProfileItem(label: '이름', value: name),
        _renderProfileItem(label: '모델명', value: ''),
        _renderProfileItem(label: '차량번호', value: number),
        _renderProfileItem(label: '주소', value: address),
        _renderProfileItem(label: '전화번호', value: phone),
        _renderProfileItem(label: '주차상태', value: state.KrName),
      ],
    );
  }

  Widget _renderProfileItem({
    required String label,
    required String? value,
  }) {
    return Row(
      children: [
        Text(label),
        Text(value ?? ''),
      ],
    );
  }
}
