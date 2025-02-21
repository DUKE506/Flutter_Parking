//리포지토리 페이지
//서버 작업 전까지 Mock Up data 관리 페이지

//대시보드 데이터
//
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_parking/car/const/data.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:flutter_parking/common/model/list_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_repository.g.dart';

//리포지토리 프로바이더
@riverpod
CarRepository carRepository(ref) {
  final repo = MockCarRepository();
  return repo;
}

//Car 리포 인터페이스(임시)
@RestApi()
abstract class CarRepository {
  factory CarRepository(Dio dio, {String baseUrl}) = _CarRepository;
  //대시보드 데이터[인터페이스]
  Future<List<CarDashboardModel>> getCarStatusMock();
  //주차차량 조회
  Future<ListModel<CarParkingModel>> getCarParkingByTypeMock(
      {required CarType type});

  //대시보드 데이터 조회
  @GET('/')
  Future<List<CarDashboardModel>> getCarCount();

  @GET('/{type}')
  Future<List<CarParkingModel>> getCarByType();
}

//목업 리포지토리
class MockCarRepository implements CarRepository {
  //대시보드 데이터
  @override
  Future<List<CarDashboardModel>> getCarStatusMock() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return carDashBoardData
        .map((json) => CarDashboardModel.fromJson(json))
        .toList();
  }

  //타입별 주차 차량 조회
  @override
  Future<ListModel<CarParkingModel>> getCarParkingByTypeMock({
    required CarType type,
  }) async {
    await Future.delayed(Duration(milliseconds: 300));
    //전체 경우 리턴
    if (type == CarType.all) {
      final data = ListModel<CarParkingModel>(
        data: carParkingData
            .map(
              (json) => CarParkingModel.fromJson(json),
            )
            .toList(),
      );
      return data;
    }

    //타입별 데이터
    final filterData =
        carParkingData.where((json) => json['carType'] == type.name).toList();

    final data = ListModel<CarParkingModel>(
      data: filterData.map((json) => CarParkingModel.fromJson(json)).toList(),
    );
    return data;
  }

  @override
  Future<List<CarParkingModel>> getCarByType() {
    // TODO: implement getCarByType
    throw UnimplementedError();
  }

  @override
  Future<List<CarDashboardModel>> getCarCount() {
    // TODO: implement getCarCount
    throw UnimplementedError();
  }
}
