import 'package:json_annotation/json_annotation.dart';

enum VisitPurpose {
  Failmy,
  Business,
  Repairers;

  String get KrName {
    switch (this) {
      case VisitPurpose.Failmy:
        return '가족';
      case VisitPurpose.Business:
        return '비즈니스';
      case VisitPurpose.Repairers:
        return '수리업체';
    }
  }
}

@JsonSerializable()
//방문차량 등록 모델
class VisitCarAddModel {
  //이름
  final String name;
  //차량번호
  final String number;
  //전화번호
  final String phone;
  //방문목적
  final VisitPurpose purpose;
  //예상출차시간
  final DateTime departureTime;

  VisitCarAddModel({
    required this.name,
    required this.number,
    required this.phone,
    required this.purpose,
    required this.departureTime,
  });
}
