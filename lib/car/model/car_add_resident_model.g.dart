// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_add_resident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarAddResidentModel _$CarAddResidentModelFromJson(Map<String, dynamic> json) =>
    CarAddResidentModel(
      name: json['name'] as String?,
      carNumber: json['carNumber'] as String?,
      phone: json['phone'] as String?,
      zoneCode: json['zoneCode'] as String?,
      address: json['address'] as String?,
      detailAddress: json['detailAddress'] as String?,
    );

Map<String, dynamic> _$CarAddResidentModelToJson(
        CarAddResidentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'carNumber': instance.carNumber,
      'phone': instance.phone,
      'zoneCode': instance.zoneCode,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
    };
