import 'package:json_annotation/json_annotation.dart';

part 'car_add_resident_model.g.dart';

@JsonSerializable()
class CarAddResidentModel {
  //이름
  String? name;
  //차량번호
  String? carNumber;
  //전화번호
  String? phone;
  //우편번호
  String? zoneCode;
  //주소
  String? address;
  //상세주소
  String? detailAddress;

  //생성자
  CarAddResidentModel({
    this.name,
    this.carNumber,
    this.phone,
    this.zoneCode,
    this.address,
    this.detailAddress,
  });

  Map<String, dynamic> toJson() => _$CarAddResidentModelToJson(this);
}
