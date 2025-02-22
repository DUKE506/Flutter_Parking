import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/repository/car_repository.dart';
import 'package:flutter_parking/common/model/list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_provider.g.dart';

@riverpod
Future<List<CarDashboardModel>> carDashboardState(ref) async {
  final repository = ref.watch(carRepositoryProvider);

  //목업 데이터로 세팅
  //데이터가 없는경우가 존재하지 않음(추후 추가)

  // 1.데이터가 존재하는 경우
  final data = repository.getCarCount();
  return data;
}

final carParkingProvider =
    StateNotifierProvider<CarParkingStateNotifier, ListModelBase>((ref) {
  final repository = ref.watch(carRepositoryProvider);
  final notifier = CarParkingStateNotifier(repository: repository);
  return notifier;
});

class CarParkingStateNotifier extends StateNotifier<ListModelBase> {
  final CarRepository repository;

  CarParkingStateNotifier({
    required this.repository,
  }) : super(ListModel(data: []));

  //주차 목록 조회
  Future<void> getCarParking({required CarType type}) async {
    state = ListModelLoading();

    state = await repository.getCarByType(type: type);
  }
}
