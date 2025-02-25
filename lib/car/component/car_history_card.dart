import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_detail_model.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CarHistoryCard extends StatelessWidget {
  final String date;
  final List<ParkingHistory> history;
  const CarHistoryCard({
    super.key,
    required this.date,
    required this.history,
  });

  factory CarHistoryCard.fromModel(
      {required String date, required List<ParkingHistory> history}) {
    return CarHistoryCard(
      date: date,
      history: history,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderTitle(),
        Column(
          spacing: 8,
          children: [
            ...history.map(
              (e) => _renderHistoryItem(id: e.id, state: e.state, time: e.time),
            ),
          ],
        ),
      ],
    );
  }

  Widget _renderTitle() {
    return Text(
      date,
      style: TextStyle(
        fontSize: 15,
        color: DEACTIVATE_TEXT_COLOR,
      ),
    );
  }

  Widget _renderHistoryItem({
    required String id,
    required ParkingState state,
    required DateTime time,
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
            //hh:mm:ss.000Z 붙어있어서 처리함 -> util 개발 예정
            time.toString().split(' ')[1].split('.')[0],
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          Container(
            color: state == ParkingState.OUT
                ? PARKING_EXTERNAL_BACK_COLOR
                : PARKING_ALL_BACK_COLOR,
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              state == ParkingState.OUT ? '출차' : '입차',
              style: TextStyle(
                fontSize: 12.0,
                color: state == ParkingState.OUT
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
