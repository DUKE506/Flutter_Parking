import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_parking_card.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:flutter_parking/car/provider/car_provider.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarParkingListScreen extends ConsumerStatefulWidget {
  final CarType carType;
  const CarParkingListScreen({
    super.key,
    required this.carType,
  });

  @override
  ConsumerState<CarParkingListScreen> createState() =>
      _CarParkingListScreenState();
}

class _CarParkingListScreenState extends ConsumerState<CarParkingListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;
  late CarType type;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    type = widget.carType;
    _tabController = TabController(
      length: CarType.values.length,
      vsync: this,
      initialIndex: CarType.values.indexOf(widget.carType),
    );
    _tabController.addListener(tabListener);
  }

  void tabListener() {
    tabIndex = _tabController.index;
    type = CarType.values[tabIndex];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(carParkingProvider);
    ref.read(carParkingProvider.notifier).getCarPkaring(type: type);

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
            // _renderList(provider),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: CarType.values.map((type) {
                  return Container(
                    color: BACKGROUND_BLUE_LIGHT_COLOR,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          spacing: 8,
                          children: provider
                              .map(
                                (model) =>
                                    CarParkingCard.fromModel(model: model),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
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

  // Widget _renderList(List<CarParkingModel> models) {
  //   return Expanded(
  //     child: TabBarView(
  //         controller: _tabController, children: CarType.values.map((type) {})),
  //   );
  // }
}


//  Container(
//           color: BACKGROUND_BLUE_LIGHT_COLOR,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//               child: Column(
//                 spacing: 8,
//                 children: models
//                     .map(
//                       (model) => CarParkingCard.fromModel(model: model),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//         ),