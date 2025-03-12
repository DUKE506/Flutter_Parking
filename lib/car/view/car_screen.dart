import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_dashboard_card.dart';
import 'package:flutter_parking/car/component/car_dashboard_card2.dart';

import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/provider/car_provider.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CarScreen extends ConsumerStatefulWidget {
  const CarScreen({super.key});

  @override
  ConsumerState<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends ConsumerState<CarScreen> {
  bool _dashBoardSwitch = false;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(carDashboardStateProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(carDashboardStateProvider);
      },
      color: PRIMARY_COLOR,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                data.when(
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                  data: (models) {
                    return _dashBoardSwitch
                        ? _renderDashboard(models: models)
                        : _renderDashboard2(models: models, context: context);
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text('데이터 조회 실패 ${stackTrace}'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //대시보드1
  Widget _renderDashboard({required List<CarDashboardModel> models}) {
    return GridView.count(
      childAspectRatio: 1.5,
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      children: models.map(
        (model) {
          return CarDashboardCard.fromModel(model: model);
        },
      ).toList(),
    );
  }

  //대시보드2
  Widget _renderDashboard2(
      {required List<CarDashboardModel> models,
      required BuildContext context}) {
    return Column(
      spacing: 8.0,
      children: List.generate(
        models.length,
        (index) => CarDashboardCard2.fromModel(
            model: models[index],
            isFirst: index == 0,
            onTap: () =>
                context.push('/parking/${models[index].carType}').then((value) {
                  ref.invalidate(carDashboardStateProvider);
                  setState(() {});
                })),
      ),
    );
  }

  //스위치
  Widget renderSwitch() {
    return Transform.scale(
      alignment: Alignment.centerRight,
      scale: 0.7, // 1보다 작은 값으로 설정하면 Switch가 작아집니다.
      child: Container(
        alignment: Alignment.centerRight,
        child: Switch(
          value: _dashBoardSwitch,
          onChanged: (value) {
            setState(() {
              _dashBoardSwitch = value;
            });
          },
        ),
      ),
    );
  }

  SizedBox _renderSizedBox({double? size = 16}) {
    return SizedBox(
      height: size,
    );
  }
}
