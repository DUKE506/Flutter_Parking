import 'package:flutter_parking/car/model/car_add_visit_model.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';
import 'package:flutter_parking/car/repository/car_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CarDetailModel> carDetail(Ref ref, {required String carNumber}) async {
  final repository = ref.watch(carRepositoryProvider);

  final res = await repository.getDetailByCarNumber(carNumber: carNumber);

  return res;
}

@riverpod
class AsyncCarDetail extends _$AsyncCarDetail {
  Future<CarDetailModel> _fetchCarDetail({required String carNumber}) async {
    final repository = ref.read(carRepositoryProvider);
    return await repository.getDetailByCarNumber(carNumber: carNumber);
  }

  @override
  FutureOr<CarDetailModel> build(String carNumber) async {
    return await _fetchCarDetail(carNumber: carNumber);
  }

  Future<void> addVisitCar(CarAddVisitModel model) async {
    state = const AsyncValue.loading();

    final repository = ref.read(carRepositoryProvider);
    await AsyncValue.guard(() async {
      await repository.addVisitCar(model: model);
    });
  }
}
