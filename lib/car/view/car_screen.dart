import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_dashboard_card.dart';
import 'package:flutter_parking/car/component/car_dashboard_card2.dart';
import 'package:flutter_parking/car/component/search_field.dart';

import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/provider/car_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '일동미라주',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    _renderSizedBox(size: 8),
                    Text(
                      '이동희 관리자님',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                renderSwitch(),
              ],
            ),
            _renderSizedBox(),
            SearchField(
              hintText: '차량 번호',
              readOnly: true,
            ),
            _renderSizedBox(),
            data.when(
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              data: (models) {
                return _dashBoardSwitch
                    ? _renderDashboard(models: models)
                    : _renderDashboard2(models: models);
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
  Widget _renderDashboard2({required List<CarDashboardModel> models}) {
    return Column(
      spacing: 8.0,
      children: List.generate(
        models.length,
        (index) => CarDashboardCard2.fromModel(
          model: models[index],
          isFirst: index == 0,
        ),
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
