import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CarDashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color textColor;
  final Color backColor;

  const CarDashboardCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    required this.backColor,
  });

  factory CarDashboardCard.fromModel({required CarDashboardModel model}) {
    Color textColor = PARKING_ALL_TEXT_COLOR;
    Color backColor = PARKING_ALL_BACK_COLOR;
    IconData icon = Icons.directions_car;

    switch (model.carType) {
      case CarType.all:
        break;
      case CarType.resident:
        textColor = PARKING_RESIDENT_TEXT_COLOR;
        backColor = PARKING_RESIDENT_BACK_COLOR;
        icon = Icons.apartment_outlined;
        break;
      case CarType.visit:
        textColor = PARKING_VISITOR_TEXT_COLOR;
        backColor = PARKING_VISITOR_BACK_COLOR;
        icon = Icons.person_add_alt_1_outlined;
        break;
      case CarType.outside:
        textColor = PARKING_EXTERNAL_TEXT_COLOR;
        backColor = PARKING_EXTERNAL_BACK_COLOR;
        icon = Icons.groups_outlined;
        break;
      default:
        break;
    }
    return CarDashboardCard(
      icon: icon,
      label: model.carType.KrName,
      value: model.value.toString(),
      textColor: textColor,
      backColor: backColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: backColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: textColor,
              ),
              SizedBox(width: 8.0),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
