// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParkingHistory _$ParkingHistoryFromJson(Map<String, dynamic> json) =>
    ParkingHistory(
      id: json['id'] as String,
      time: DateTime.parse(json['time'] as String),
      state: $enumDecode(_$ParkingStateEnumMap, json['state']),
    );

Map<String, dynamic> _$ParkingHistoryToJson(ParkingHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'state': _$ParkingStateEnumMap[instance.state]!,
    };

const _$ParkingStateEnumMap = {
  ParkingState.IN: 'IN',
  ParkingState.OUT: 'OUT',
};

CarDetailModel _$CarDetailModelFromJson(Map<String, dynamic> json) =>
    CarDetailModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      modelName: json['modelName'] as String?,
      number: json['number'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      carType: $enumDecode(_$CarTypeEnumMap, json['carType']),
      state: $enumDecode(_$ParkingStateEnumMap, json['state']),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => ParkingHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarDetailModelToJson(CarDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'modelName': instance.modelName,
      'number': instance.number,
      'address': instance.address,
      'phone': instance.phone,
      'carType': _$CarTypeEnumMap[instance.carType]!,
      'state': _$ParkingStateEnumMap[instance.state]!,
      'history': instance.history,
    };

const _$CarTypeEnumMap = {
  CarType.all: 'all',
  CarType.resident: 'resident',
  CarType.visit: 'visit',
  CarType.outside: 'outside',
};
