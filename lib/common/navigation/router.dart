import 'package:flutter_parking/common/view/root_tab.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => RootTab(),
  )
]);
