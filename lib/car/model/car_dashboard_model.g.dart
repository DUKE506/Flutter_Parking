// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDashboardModel _$CarDashboardModelFromJson(Map<String, dynamic> json) =>
    CarDashboardModel(
      carType: $enumDecode(_$CarTypeEnumMap, json['carType']),
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$CarDashboardModelToJson(CarDashboardModel instance) =>
    <String, dynamic>{
      'carType': _$CarTypeEnumMap[instance.carType]!,
      'value': instance.value,
    };

const _$CarTypeEnumMap = {
  CarType.all: 'all',
  CarType.resident: 'resident',
  CarType.visit: 'visit',
  CarType.outside: 'outside',
};
