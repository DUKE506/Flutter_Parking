import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_detail_model.g.dart';

@JsonEnum(valueField: 'state')
enum ParkingState {
  @JsonValue('IN')
  IN,
  @JsonValue('OUT')
  OUT;

  //변환
  String get KrName {
    switch (this) {
      case ParkingState.IN:
        return '입차';
      case ParkingState.OUT:
        return '출차';
    }
  }
}

@JsonSerializable()
class ParkingHistory {
  final String id;
  final DateTime time;
  final ParkingState state;

  ParkingHistory({
    required this.id,
    required this.time,
    required this.state,
  });

  factory ParkingHistory.fromJson(Map<String, dynamic> json) =>
      _$ParkingHistoryFromJson(json);
}

//차량 상세 모델
@JsonSerializable()
class CarDetailModel {
  //식별자
  final String id;
  //차주명
  final String? name;
  //모델명
  final String? modelName;
  //차량번호
  final String number;
  //주소
  final String? address;
  //전화번호
  final String? phone;
  //차량구분
  final CarType carType;
  //주차상태
  final ParkingState state;
  //주차이력
  final List<ParkingHistory>? history;

  CarDetailModel({
    required this.id,
    this.name,
    this.modelName,
    required this.number,
    this.address,
    this.phone,
    required this.carType,
    required this.state,
    this.history,
  });

  factory CarDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CarDetailModelFromJson(json);
}
