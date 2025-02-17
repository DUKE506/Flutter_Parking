//리포지토리 페이지
//서버 작업 전까지 Mock Up data 관리 페이지

//대시보드 데이터
//
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_repository.g.dart';

final List<Map<String, dynamic>> _carDashBoardData = [
  {
    'carType': 'all',
    'value': 121,
  },
  {
    'carType': 'resident',
    'value': 86,
  },
  {
    'carType': 'visit',
    'value': 29,
  },
  {
    'carType': 'outside',
    'value': 6,
  },
];

//리포지토리 프로바이더
@riverpod
CarRepository carRepository(ref) {
  final repo = MockCarRepository();
  return repo;
}

//Car 리포 인터페이스(임시)
abstract class CarRepository {
  //데시보드 데이터[인터페이스]
  Future<List<CarDashboardModel>> getCarStatus();
}

//목업 리포지토리
class MockCarRepository implements CarRepository {
  //대시보드 데이터
  @override
  Future<List<CarDashboardModel>> getCarStatus() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return _carDashBoardData
        .map((json) => CarDashboardModel.fromJson(json))
        .toList();
  }
}
