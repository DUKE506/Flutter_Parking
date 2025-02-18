//리포지토리 페이지
//서버 작업 전까지 Mock Up data 관리 페이지

//대시보드 데이터
//
import 'package:flutter_parking/car/const/data.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_repository.g.dart';

//리포지토리 프로바이더
@riverpod
CarRepository carRepository(ref) {
  final repo = MockCarRepository();
  return repo;
}

//Car 리포 인터페이스(임시)
abstract class CarRepository {
  //대시보드 데이터[인터페이스]
  Future<List<CarDashboardModel>> getCarStatus();
  //주차차량 조회
  Future<List<CarParkingModel>> getCarParkingAll();
}

//목업 리포지토리
class MockCarRepository implements CarRepository {
  //대시보드 데이터
  @override
  Future<List<CarDashboardModel>> getCarStatus() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return carDashBoardData
        .map((json) => CarDashboardModel.fromJson(json))
        .toList();
  }

  //주차차량 전체
  @override
  Future<List<CarParkingModel>> getCarParkingAll() async {
    // TODO: implement getCarParkingAll
    await Future.delayed(Duration(seconds: 1));
    return carParkingData
        .map((json) => CarParkingModel.fromJson(json))
        .toList();
  }
}
