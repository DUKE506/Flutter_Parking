import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_parking_model.g.dart';

@JsonSerializable()
class CarParkingModel {
  final String id;
  final String number;
  final String name;
  final CarType carType;
  final DateTime entryTime;

  CarParkingModel({
    required this.id,
    required this.number,
    required this.name,
    required this.carType,
    required this.entryTime,
  });

  factory CarParkingModel.fromJson(Map<String, dynamic> json) =>
      _$CarParkingModelFromJson(json);
}
