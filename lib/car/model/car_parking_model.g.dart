// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarParkingModel _$CarParkingModelFromJson(Map<String, dynamic> json) =>
    CarParkingModel(
      id: json['id'] as String,
      number: json['number'] as String,
      name: json['name'] as String,
      carType: $enumDecode(_$CarTypeEnumMap, json['carType']),
      entryTime: DateTime.parse(json['entryTime'] as String),
    );

Map<String, dynamic> _$CarParkingModelToJson(CarParkingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'carType': _$CarTypeEnumMap[instance.carType]!,
      'entryTime': instance.entryTime.toIso8601String(),
    };

const _$CarTypeEnumMap = {
  CarType.all: 'all',
  CarType.resident: 'resident',
  CarType.visit: 'visit',
  CarType.outside: 'outside',
};
