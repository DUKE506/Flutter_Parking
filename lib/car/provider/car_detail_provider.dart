import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';
import 'package:flutter_parking/car/repository/car_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'car_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CarDetailModel> carDetail(Ref ref, {required String id}) async {
  final repository = ref.watch(carRepositoryProvider);

  final res = await repository.getDetailById(id: id);

  return res;
}
