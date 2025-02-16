import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/component/stat_card.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
            _renderSizedBox(),
            SearchField(
              hintText: '차량 번호',
              readOnly: true,
            ),
            _renderSizedBox(),
            GridView.count(
              childAspectRatio: (1 / .6),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                StatCard(
                  icon: Icons.directions_car_outlined,
                  label: '전체',
                  value: '121',
                  color: PARKING_ALL_TEXT_COLOR,
                  backColor: PARKING_ALL_BACK_COLOR,
                ),
                StatCard(
                  icon: Icons.directions_car_outlined,
                  label: '전체',
                  value: '121',
                  color: PARKING_ALL_TEXT_COLOR,
                  backColor: PARKING_ALL_BACK_COLOR,
                ),
                StatCard(
                  icon: Icons.directions_car_outlined,
                  label: '전체',
                  value: '121',
                  color: PARKING_ALL_TEXT_COLOR,
                  backColor: PARKING_ALL_BACK_COLOR,
                ),
                StatCard(
                  icon: Icons.directions_car_outlined,
                  label: '전체',
                  value: '121',
                  color: PARKING_ALL_TEXT_COLOR,
                  backColor: PARKING_ALL_BACK_COLOR,
                ),
              ],
            ),
          ],
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
