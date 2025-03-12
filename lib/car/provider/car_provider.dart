import 'package:flutter_parking/car/model/car_add_resident_model.dart';
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

//프로바이더
final carStateProvider =
    StateNotifierProvider.family<CarStateNotifier, ListModelBase, CarType?>(
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
  final CarType? type;

  //생성자
  CarStateNotifier({
    required this.repository,
    this.type,
  }) : super(ListModelLoading()) {
    if (type != null) {
      fetchData();
    }
  }

  //조회
  Future<void> fetchData() async {
    // print('[CarStateNotifier][fetchData] 조회 함수 시작 (파라미터 : ${type})');
    state = ListModelLoading();

    if (type == null) {
      return;
    }
    state = await repository.getCarByType(type: type!);
  }

  void getDetail({required String carNumber}) async {
    print('[CarStateNotifier][getDetail] 상세조회 함수 시작 (파라미터 : ${carNumber})');
    final res = await repository.getDetailByCarNumber(carNumber: carNumber);
  }
}

//=======================================================

@riverpod
class AsyncResidentNotifier extends _$AsyncResidentNotifier {
  @override
  FutureOr<CarAddResidentModel> build() async {
    return CarAddResidentModel();
  }

  Future<void> addResidentCar(CarAddResidentModel model) async {
    state = const AsyncValue.loading();

    final repository = ref.read(carRepositoryProvider);

    await AsyncValue.guard(() async {
      await repository.addResidentCar(model: model);
    });
  }
}
