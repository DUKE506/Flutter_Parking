import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:go_router/go_router.dart';

class CarDashboardCard2 extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color textColor;
  final Color backColor;
  final bool? isFirst;
  //필요할 때만(url 때문에 사용중)
  final CarType? carType;

  const CarDashboardCard2({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.textColor,
    required this.backColor,
    this.carType,
    this.isFirst = false,
  });

  factory CarDashboardCard2.fromModel(
      {required CarDashboardModel model, bool? isFirst = false}) {
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
    }
    return CarDashboardCard2(
      icon: icon,
      label: model.carType.KrName,
      value: model.value.toString(),
      textColor: textColor,
      backColor: backColor,
      isFirst: isFirst,
      carType: model.carType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isFirst == true ? _renderMain(context) : _renderItem(context);
  }

  //메인 카드
  Widget _renderMain(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/parking/$carType');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: textColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: backColor,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      color: backColor,
                    ),
                  ),
                ],
              ),
              Icon(
                icon,
                size: 40,
                color: backColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //하위 카드
  Widget _renderItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/parking/$carType');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: backColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 25,
                        color: textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
