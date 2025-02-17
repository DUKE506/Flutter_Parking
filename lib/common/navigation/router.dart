import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/view/car_parking_list_screen.dart';
import 'package:flutter_parking/common/view/root_tab.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => RootTab(),
  ),
  GoRoute(
    path: '/parking/:carType',
    builder: (context, state) => CarParkingListScreen(
      carType: CarType.values
          .firstWhere((e) => e.toString() == state.pathParameters['carType']),
    ),
  ),
]);
