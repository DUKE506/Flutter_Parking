import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/car_parking_card.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/model/car_dashboard_model.dart';
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
  //CustomScroll start
  late TabController tabController;
  late ScrollController scrollController;
  int tabIndex = 0;
  late CarType type;
  //CustomScroll end

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //=======================
    tabController = TabController(
      length: CarType.values.length,
      vsync: this,
      initialIndex: CarType.values.indexOf(widget.carType),
    );
    scrollController = ScrollController();
    type = widget.carType;
    //=======================

    // //탭 변경 시 리스너 등록
    tabController.addListener(tabListener);
    // _scrollController.addListener(scrollListener);
  }

  //스크롤시 리스너
  // void scrollListener() {
  //   if (sc.position.pixels != 0) {
  //     isTopPosition = false;
  //   } else {
  //     isTopPosition = true;
  //   }

  //   setState(() {});
  // }

  //탭 누를 때마다 실행
  void tabListener() {
    //인덱스가 변경됐을때만
    if (!tabController.indexIsChanging) {
      return;
    }
    tabIndex = tabController.index;
    type = CarType.values[tabIndex];
    ref.read(carStateProvider(type).notifier).fetchData();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.read(carParkingProvider.notifier).getCarParking(type: type);
      ref.read(carStateProvider(type).notifier).fetchData();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    scrollController.dispose();

    // _tabController.dispose();
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rawData = ref.watch(carStateProvider(type));

    return DefaultLayout(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _sliverAppBar(),
            _sliverPersistentSearchHeader(),
            _sliverPersistentTabBarHeader(tabController),
          ];
        },
        body: _sliverBody(controller: scrollController, rawData: rawData),
      ),
    );
  }

  //CustomScrollView START

  //SliverAppBar
  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '주차',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  SliverPersistentHeader _sliverPersistentSearchHeader() {
    return SliverPersistentHeader(
      floating: true,
      delegate: SearchDelegate(),
    );
  }

  SliverPersistentHeader _sliverPersistentTabBarHeader(
      TabController controller) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: TabBarDelegate(controller: controller),
    );
  }

  Widget _sliverBody({
    required ScrollController controller,
    required ListModelBase rawData,
  }) {
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
      controller: tabController,
      physics: NeverScrollableScrollPhysics(),
      children: CarType.values.map(
        (type) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(carStateProvider(type));
            },
            color: PRIMARY_COLOR,
            backgroundColor: Colors.white,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                // vertical: 16.0,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // 데이터의 총 높이 계산 (대략적인 값, 실제 높이는 렌더링 후에만 알 수 있음)
                  double estimatedHeight =
                      data.data.length * 100.0; // 카드 높이 + 패딩 값을 대략적으로 예상
                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: CarParkingCard.fromModel(
                                model: data.data[index]),
                          ),
                          childCount: data.data.length,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  //CustomScrollView END

  //floatingActionBtn
  Widget _floatingActionButton({required bool isExpanded}) {
    return SizedBox(
      child: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          '방문차량 등록',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          // side: BorderSide(width: 2, color: PRIMARY_COLOR),
        ),
        backgroundColor: PRIMARY_COLOR,
        elevation: 1.5,
        splashColor: PRIMARY_LIGHT_COLOR,
      ),
    );
  }

  //tab 컴포넌트
  SliverToBoxAdapter _tab({required TabController tabController}) {
    return SliverToBoxAdapter(
      child: TabBar(
        onTap: (index) {
          tabController.animateTo(index);
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
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  const TabBarDelegate({
    required this.controller,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: controller,
        tabs: [
          ...CarType.values.map(
            (type) => Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white,
                child: Text(
                  type.KrName,
                ),
              ),
            ),
          )
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class SearchDelegate extends SliverPersistentHeaderDelegate {
  const SearchDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SearchField(),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
