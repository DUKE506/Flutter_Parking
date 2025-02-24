import 'package:flutter/material.dart';
import 'package:flutter_parking/car/provider/car_provider.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarDetailScreen extends ConsumerStatefulWidget {
  final String id;
  const CarDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends ConsumerState<CarDetailScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(carStateProvider(null).notifier).getDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(carDetailProvider(id: widget.id));
    return DefaultLayout(
      title: '상세정보',
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderProfile(),
            renderHistory(),
          ],
        ),
      ),
    );
  }

  Widget renderProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        spacing: 16.0,
        children: [
          _profileItem(label: '이름', value: '이동희'),
          _profileItem(label: '모델명', value: '스포티지'),
          _profileItem(label: '차량번호', value: '07가 4911'),
          _profileItem(label: '주소', value: '103동 1208호'),
          _profileItem(label: '전화번호', value: '010-3266-5670'),
          _profileItem(
              label: '주차상태', value: '출차', color: PARKING_EXTERNAL_TEXT_COLOR),
        ],
      ),
    );
  }

  //차량 정보
  Widget _profileItem({
    required String label,
    required String value,
    Color? color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: DEACTIVATE_TEXT_COLOR,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: color ?? TEXT_COLOR,
          ),
        ),
      ],
    );
  }

  //입출차 기록
  Widget renderHistory() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '입출차 이력',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          //===============================
          _date(value: '2025.01.07.'),
          SizedBox(
            height: 8,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),

          SizedBox(
            height: 16,
          ),

          _date(value: '2025.01.07.'),
          SizedBox(
            height: 8,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),

          SizedBox(
            height: 16,
          ),

          _date(value: '2025.01.07.'),
          SizedBox(
            height: 8,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),

          SizedBox(
            height: 16,
          ),

          _date(value: '2025.01.07.'),
          SizedBox(
            height: 8,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),

          SizedBox(
            height: 16,
          ),

          _date(value: '2025.01.07.'),
          SizedBox(
            height: 8,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: true),
          SizedBox(
            height: 4,
          ),
          _historyItem(label: '07:24:45', isOut: false),

          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  //날짜
  Widget _date({required String value}) {
    return Text(
      value,
      style: TextStyle(
          fontSize: 15,
          // fontWeight: FontWeight.w600,
          color: DEACTIVATE_TEXT_COLOR),
    );
  }

  //입출차 이력 아이템
  Widget _historyItem({
    required String label,
    required bool isOut,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: BACKGROUND_GREY_LIGHT_COLOR,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          Container(
            color: isOut ? PARKING_EXTERNAL_BACK_COLOR : PARKING_ALL_BACK_COLOR,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              isOut ? '출차' : '입차',
              style: TextStyle(
                fontSize: 12.0,
                color: isOut
                    ? PARKING_EXTERNAL_TEXT_COLOR
                    : PARKING_ALL_TEXT_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
