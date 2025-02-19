import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_parking_card.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
import 'package:flutter_parking/car/model/car_parking_model.dart';
import 'package:flutter_parking/car/provider/car_provider.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:flutter_parking/common/model/list_model.dart';
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
    print('===================inits 실행===================');
    // TODO: implement initState
    super.initState();
    type = widget.carType;
    _tabController = TabController(
      length: CarType.values.length,
      vsync: this,
      initialIndex: CarType.values.indexOf(widget.carType),
    );

    //탭 변경 시 리스너 등록
    _tabController.addListener(tabListener);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    ref.read(carParkingProvider.notifier).getCarParking(type: type);
  }

  //탭 누를 때마다 실행
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
    final rawData = ref.watch(carParkingProvider);

    return DefaultLayout(
      title: '주차 차량',
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _renderTop(_tabController),
          ];
        },
        // body: carParkingTabBarView(
        //   data: rawData,
        //   tabController: _tabController,
        // ),
        body: _renderTabBarView(
          controller: _tabController,
          rawData: rawData,
        ),
      ),
    );
  }

  //검색 앱바
  SliverAppBar _renderTop(TabController controller) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      title: Container(
        child: SearchField(),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          //탭
          child: _tap(controller),
        ),
      ),
    );
  }

  //tab 컴포넌트
  Widget _tap(TabController tabController) {
    return TabBar(
      onTap: (index) {
        tabController.animateTo(index);
        final newType = CarType.values[tabIndex];
        ref.read(carParkingProvider.notifier).getCarParking(type: newType);
        // setState(() {});
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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
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
            ),
          );
        },
      ),
    );
  }

  Widget _renderTabBarView(
      {required TabController controller, required ListModelBase rawData}) {
    //로딩
    if (rawData is ListModelLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    //에러
    if (rawData is ListModelError) {
      return Center(
        child: Text(
          rawData.message,
        ),
      );
    }

    final data = rawData as ListModel;

    return TabBarView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      children: CarType.values.map(
        (type) {
          return Container(
            color: BACKGROUND_BLUE_LIGHT_COLOR,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CarParkingCard.fromModel(model: data.data[index]),
                );
              },
              itemCount: data.data.length,
            ),
          );
        },
      ).toList(),
    );
  }
}

class carParkingTabBarView extends ConsumerStatefulWidget {
  final ListModelBase data;
  final TabController tabController;
  const carParkingTabBarView({
    super.key,
    required this.data,
    required this.tabController,
  });

  @override
  ConsumerState<carParkingTabBarView> createState() =>
      _carParkingTabBarViewState();
}

class _carParkingTabBarViewState extends ConsumerState<carParkingTabBarView> {
  @override
  Widget build(BuildContext context) {
    // final rawData = ref.watch(carParkingProvider);
    final rawData = widget.data;
    if (rawData is ListModelLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    //에러
    if (rawData is ListModelError) {
      return DefaultLayout(
        body: Center(
          child: Text(
            rawData.message,
          ),
        ),
      );
    }

    final data = rawData as ListModel;

    return TabBarView(
      controller: widget.tabController,
      physics: NeverScrollableScrollPhysics(),
      children: CarType.values.map(
        (type) {
          return Container(
            color: BACKGROUND_BLUE_LIGHT_COLOR,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CarParkingCard.fromModel(model: data.data[index]),
                );
              },
              itemCount: data.data.length,
            ),
          );
        },
      ).toList(),
    );
  }
}
