import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CarTypeColor {
  static List<Color> getTypeColor(CarType type) {
    switch (type) {
      case CarType.all:
        return [
          PARKING_ALL_TEXT_COLOR,
          PARKING_ALL_BACK_COLOR,
        ];
      case CarType.resident:
        return [
          PARKING_RESIDENT_TEXT_COLOR,
          PARKING_RESIDENT_BACK_COLOR,
        ];
      case CarType.visit:
        return [
          PARKING_VISITOR_TEXT_COLOR,
          PARKING_VISITOR_BACK_COLOR,
        ];
      case CarType.outside:
        return [
          PARKING_EXTERNAL_TEXT_COLOR,
          PARKING_EXTERNAL_BACK_COLOR,
        ];
    }
  }
}
