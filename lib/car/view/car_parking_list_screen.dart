import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_parking_card.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';

class CarParkingListScreen extends StatefulWidget {
  final CarType carType;
  const CarParkingListScreen({
    super.key,
    required this.carType,
  });

  @override
  State<CarParkingListScreen> createState() => _CarParkingListScreenState();
}

class _CarParkingListScreenState extends State<CarParkingListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: CarType.values.length,
      vsync: this,
      initialIndex: CarType.values.indexOf(widget.carType),
    );
    _tabController.addListener(tabListener);
  }

  void tabListener() {
    tabIndex = _tabController.index;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '주차 차량',
        body: Column(
          spacing: 16.0,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchField(),
            ),
            _renderTabBar(_tabController),
            _renderList(),
          ],
        ));
  }

  //tab
  Widget _renderTabBar(TabController tabController) {
    return TabBar(
      onTap: (index) {
        tabController.animateTo(index);
        setState(() {});
      },
      //컨트롤러
      controller: tabController,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //tabbar 전체 bottom border
      dividerColor: Colors.transparent,
      //선택 되었다는 효과
      indicator: BoxDecoration(),

      labelPadding: EdgeInsets.zero,

      unselectedLabelColor: DEACTIVATE_TEXT_COLOR,
      labelColor: ACCENT_DEEP_COLOR,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      unselectedLabelStyle: TextStyle(),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
      tabs: List.generate(
        CarType.values.length,
        (index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: index == tabController.index
                  ? ACCENT_LIGHT_COLOR
                  : BACKGROUND_GREY_LIGHT_COLOR,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 12.0,
              ),
              child: Text(
                CarType.values[index].KrName,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderList() {
    return Expanded(
      child: Container(
        color: BACKGROUND_BLUE_LIGHT_COLOR,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              spacing: 8,
              children: [
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
                CarParkingCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
