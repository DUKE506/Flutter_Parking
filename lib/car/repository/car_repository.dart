//리포지토리 페이지
//서버 작업 전까지 Mock Up data 관리 페이지

//대시보드 데이터
//

import 'package:dio/dio.dart';
import 'package:flutter_parking/car/model/car_add_resident_model.dart';
import 'package:flutter_parking/car/model/car_add_visit_model.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:flutter_parking/common/const/data.dart';
import 'package:flutter_parking/common/dio/dio.dart';
import 'package:flutter_parking/common/model/list_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_repository.g.dart';

//리포지토리 프로바이더
@riverpod
CarRepository carRepository(ref) {
  final dio = ref.watch(dioStateProvider);
  final repo = CarRepository(dio, baseUrl: 'http://$ip/car');

  return repo;
}

//Car 리포 인터페이스(임시)
@RestApi()
abstract class CarRepository {
  factory CarRepository(Dio dio, {String baseUrl}) = _CarRepository;

  @GET('/dashboard')
  Future<List<CarDashboardModel>> getCarCount();

  @GET('/{type}')
  Future<ListModel<CarParkingModel>> getCarByType({
    @Path('type') required CarType type,
  });

  @GET('/detail/{carNumber}')
  Future<CarDetailModel> getDetailByCarNumber({
    @Path('carNumber') required String carNumber,
  });

  @POST('/add/visit')
  Future<void> addVisitCar({
    @Body() required CarAddVisitModel model,
  });
  @POST('/add/resident')
  Future<void> addResidentCar({
    @Body() required CarAddResidentModel model,
  });
}
