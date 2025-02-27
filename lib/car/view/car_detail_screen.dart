import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_detail_profile_card.dart';
import 'package:flutter_parking/car/component/car_history_card.dart';
import 'package:flutter_parking/car/component/visit_bottom_sheet.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';
import 'package:flutter_parking/car/provider/car_detail_provider.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarDetailScreen extends ConsumerStatefulWidget {
  final String id;
  final CarType carType;
  const CarDetailScreen({
    super.key,
    required this.id,
    required this.carType,
  });

  @override
  ConsumerState<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends ConsumerState<CarDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(carDetailProvider(id: widget.id));

    return DefaultLayout(
      title: '상세정보',
      body: data.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        data: (data) => SingleChildScrollView(
          child: Column(
            spacing: 32,
            children: [
              CarDetailProfileCard.fromModel(model: data),
              renderHistory(data.history!)
            ],
          ),
        ),
        error: (error, stackTrace) => Container(),
      ),
      floatingActionButton: widget.carType == CarType.outside
          ? _outSideFloatingActionBtn(carNumber: '12가 3456')
          : _phoneFloatingActionBtn(),
    );
  }

  //입주민, 방문차량 floatingActionButton
  Widget _phoneFloatingActionBtn() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.phone,
        color: Colors.white,
      ),
      elevation: 3,
      splashColor: PRIMARY_LIGHT_COLOR,
      shape: CircleBorder(),
      backgroundColor: PRIMARY_COLOR,
    );
  }

  //외부차량 floatingActionButton
  Widget _outSideFloatingActionBtn({required String carNumber}) {
    final EdgeInsets padding = MediaQuery.of(context).viewInsets / 2;
    return FloatingActionButton(
      onPressed: () async {
        await showModalBottomSheet<void>(
          backgroundColor: Colors.white,
          isScrollControlled: true,
          // enableDrag: true,
          context: context,
          builder: (_) {
            return AnimatedPadding(
              padding: EdgeInsets.only(
                      bottom: MediaQuery.viewInsetsOf(context).bottom) /
                  2,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: VisitBottomSheet(carNumber: carNumber),
            );
          },
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      elevation: 3,
      splashColor: PRIMARY_LIGHT_COLOR,
      shape: CircleBorder(),
      backgroundColor: PRIMARY_COLOR,
    );
  }

  //방문차량 등록

  //입출차 기록 없는 경우 block
  Widget renderBlock() {
    return Container(
      child: Text(
        '기록이 존재하지 않습니다.',
        style: TextStyle(
          fontSize: 12.0,
          color: DEACTIVATE_TEXT_COLOR,
        ),
      ),
    );
  }

  //입출차 기록
  Widget renderHistory(List<ParkingHistory> datas) {
    Map<String, List<ParkingHistory>> groupByDate = {};

    //carHistoryCar 형태로 데이터 형변환
    if (datas.isNotEmpty) {
      datas.forEach(
        (element) {
          final key = element.time.toString().split(' ')[0];
          if (groupByDate.containsKey(key)) {
            groupByDate[key]!.add(element);
          } else {
            groupByDate.putIfAbsent(key, () => []).add(element);
          }
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: [
          Text(
            '기록',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          if (datas.isEmpty)
            renderBlock()
          else
            ...groupByDate.entries.map(
              (e) => CarHistoryCard.fromModel(
                date: e.key,
                history: e.value,
              ),
            ),
        ],
      ),
    );
  }
}
