import 'package:flutter_parking/car/model/visit_car_add_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_add_visit_model.g.dart';

@JsonSerializable()
class CarAddVisitModel {
  String? id;
  String? name;
  String? carNumber;
  String? phone;
  String? detailAddress;
  VisitPurpose? purpose;
  String? etcContext;
  DateTime? departureTime;

  CarAddVisitModel({
    this.name,
    this.carNumber,
    this.phone,
    this.detailAddress,
    this.purpose = VisitPurpose.Family,
    this.etcContext,
    this.departureTime,
  });

  Map<String, dynamic> toJson() => _$CarAddVisitModelToJson(this);
}
