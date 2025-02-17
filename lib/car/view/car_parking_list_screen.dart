import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';

class CarParkingListScreen extends StatelessWidget {
  final CarType carType;
  const CarParkingListScreen({
    super.key,
    required this.carType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        carType.toString(),
      ),
    );
  }
}
