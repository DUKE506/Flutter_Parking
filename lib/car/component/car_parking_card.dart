import 'package:flutter/material.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:flutter_parking/car/utils/car_type_color.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:go_router/go_router.dart';

class CarParkingCard extends StatelessWidget {
  final String id;
  final String number;
  final String name;
  final DateTime entryTime;
  final CarType carType;
  final Color textColor;
  final Color backColor;

  const CarParkingCard({
    super.key,
    required this.id,
    required this.number,
    required this.name,
    required this.entryTime,
    required this.carType,
    required this.textColor,
    required this.backColor,
  });

  factory CarParkingCard.fromModel({required CarParkingModel model}) {
    Color textColor = PARKING_ALL_TEXT_COLOR;
    Color backColor = PARKING_ALL_BACK_COLOR;
    String? name = model.name ?? '';
    final List<Color> colors = CarTypeColor.getTypeColor(model.carType);
    textColor = colors[0];
    backColor = colors[1];

    if (name.isEmpty) {
      name = model.carType == CarType.outside ? '외부인' : '방문자';
    }

    return CarParkingCard(
      id: model.id,
      number: model.number,
      name: name,
      entryTime: model.entryTime,
      carType: model.carType,
      textColor: textColor,
      backColor: backColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            width: 2,
            color: BACKGROUND_GREY_LIGHT_COLOR,
          ),
        ),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            //타입 필요없어짐 추수 수정 후 주석 삭제
            context.push('/parking/detail/$id/${carType.name}');
          },
          splashColor: BACKGROUND_GREY_LIGHT_COLOR,
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              spacing: 8.0,
              children: [
                Row(
                  spacing: 8.0,
                  children: [
                    //차량번호
                    _title(),
                    //뱃지
                    _badge(),
                  ],
                ),
                //출입 시간
                _time(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //차번호
  Widget _title() {
    return Text(
      number,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
        // color: TEXT_COLOR,
      ),
    );
  }

  //타입별 뱃지
  Widget _badge() {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          name,
          style: TextStyle(
              color: textColor, fontSize: 12.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  //시간
  Widget _time() {
    return Row(
      spacing: 8.0,
      children: [
        Icon(
          Icons.schedule_outlined,
          size: 16,
          color: DEACTIVATE_TEXT_COLOR,
        ),
        Text(
          entryTime.toString().split('.')[0],
          style: TextStyle(
            fontSize: 14,
            color: DEACTIVATE_TEXT_COLOR,
          ),
        ),
      ],
    );
  }
}
