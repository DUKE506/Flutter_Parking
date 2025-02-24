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

//======================================================================================================

final carStateProvider =
    StateNotifierProvider.family<CarStateNotifier, ListModelBase, CarType>(
        (ref, type) {
  //notifier에 전달할 리포지토리 호출;
  final repo = ref.watch(carRepositoryProvider);

  //상태변화를 관찰할 notifier 생성
  final notifier = CarStateNotifier(repository: repo, type: type);

  return notifier;
});

// =========구조 리펙토링 중==========
class CarStateNotifier extends StateNotifier<ListModelBase> {
  //리포지토리 필드
  final CarRepository repository;
  final CarType type;

  //생성자
  CarStateNotifier({
    required this.repository,
    required this.type,
  }) : super(ListModel(data: []));

  //조회
  Future<void> fetchData() async {
    // print('[CarStateNotifier][fetchData] 조회 함수 시작 (파라미터 : ${type})');
    state = ListModelLoading();
    state = await repository.getCarByType(type: type);
  }
}
