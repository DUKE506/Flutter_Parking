import 'package:json_annotation/json_annotation.dart';

part 'car_dashboard_model.g.dart';

enum CarType {
  all,
  resident,
  visit,
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

      default:
        throw Exception('존재하지 않는 이름입니다.');
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
