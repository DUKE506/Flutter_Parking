import 'package:json_annotation/json_annotation.dart';

part 'car_dashboard_model.g.dart';

@JsonEnum(valueField: 'carType')
enum CarType {
  @JsonValue('all')
  all,
  @JsonValue('resident')
  resident,
  @JsonValue('visit')
  visit,
  @JsonValue('outside')
  outside;

  //한글 변환
  String get KrName {
    switch (this) {
      case CarType.all:
        return '전체';
      case CarType.resident:
        return '입주';
      case CarType.visit:
        return '방문';
      case CarType.outside:
        return '외부';
    }
  }
}

//대시보드 모델
@JsonSerializable()
class CarDashboardModel {
  final CarType carType;
  final int value;

  CarDashboardModel({
    required this.carType,
    required this.value,
  });

  //Json To Model
  factory CarDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$CarDashboardModelFromJson(json);
}
