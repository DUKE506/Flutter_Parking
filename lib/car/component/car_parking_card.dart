import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';

class CarParkingCard extends StatelessWidget {
  const CarParkingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: BACKGROUND_GREY_LIGHT_COLOR,
        ),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          spacing: 8.0,
          children: [
            Row(
              spacing: 8.0,
              children: [
                //차량번호
                Text(
                  '07가 4991',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    // color: TEXT_COLOR,
                  ),
                ),
                //뱃지
                Container(
                  decoration: BoxDecoration(
                    color: PARKING_ALL_BACK_COLOR,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      '이동희',
                      style: TextStyle(
                          color: PARKING_ALL_TEXT_COLOR,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 8.0,
              children: [
                Icon(
                  Icons.schedule_outlined,
                  size: 16,
                  color: DEACTIVATE_TEXT_COLOR,
                ),
                Text(
                  '2025-02-15 18:42:17',
                  style: TextStyle(
                    fontSize: 14,
                    color: DEACTIVATE_TEXT_COLOR,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
