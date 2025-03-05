import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/view/car_detail_screen.dart';
import 'package:flutter_parking/car/view/car_parking_list_screen.dart';
import 'package:flutter_parking/car/view/car_resident_add_screen.dart';
import 'package:flutter_parking/common/view/post_search_webview.dart';
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
  GoRoute(
    path: '/parking/detail/:id/:carType',
    builder: (context, state) => CarDetailScreen(
      id: state.pathParameters['id']!,
      carType: CarType.values
          .firstWhere((e) => e.name == state.pathParameters['carType']!),
    ),
  ),
  GoRoute(
    path: '/add/resident',
    builder: (context, state) => CarResidentAddScreen(),
  ),
  GoRoute(
    path: '/address/search',
    builder: (context, state) => PostSearchWebview(),
  ),
]);
