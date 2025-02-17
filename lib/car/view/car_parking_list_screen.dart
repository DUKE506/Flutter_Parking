import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';

class CarParkingListScreen extends StatelessWidget {
  final CarType carType;
  const CarParkingListScreen({
    super.key,
    required this.carType,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '주차 차량',
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SearchField(),
            ],
          ),
        ));
  }
}
