// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_add_visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarAddVisitModel _$CarAddVisitModelFromJson(Map<String, dynamic> json) =>
    CarAddVisitModel(
      name: json['name'] as String?,
      carNumber: json['carNumber'] as String?,
      phone: json['phone'] as String?,
      detailAddress: json['detailAddress'] as String?,
      purpose: $enumDecodeNullable(_$VisitPurposeEnumMap, json['purpose']) ??
          VisitPurpose.Family,
      etcContext: json['etcContext'] as String?,
      departureTime: json['departureTime'] == null
          ? null
          : DateTime.parse(json['departureTime'] as String),
    );

Map<String, dynamic> _$CarAddVisitModelToJson(CarAddVisitModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'carNumber': instance.carNumber,
      'phone': instance.phone,
      'detailAddress': instance.detailAddress,
      'purpose': _$VisitPurposeEnumMap[instance.purpose],
      'etcContext': instance.etcContext,
      'departureTime': instance.departureTime?.toIso8601String(),
    };

const _$VisitPurposeEnumMap = {
  VisitPurpose.Family: 'Family',
  VisitPurpose.Business: 'Business',
  VisitPurpose.Repairers: 'Repairers',
  VisitPurpose.Etc: 'Etc',
};
