import 'package:flutter/material.dart';
import 'package:flutter_parking/car/component/search_field.dart';
import 'package:flutter_parking/car/view/car_screen.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(tabListener);
  }

  void tabListener() {
    tabIndex = tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: switch (tabController.index) {
        0 => _homeAppBar(),
        _ => null,
      },
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          CarScreen(),
          CarScreen(),
          CarScreen(),
        ],
      ),
      floatingActionButton:
          tabController.index == 0 ? _homeFloatingActionButton(context) : null,
      floatingActionButtonLocation: tabController.index == 0
          ? FloatingActionButtonLocation.centerFloat
          : null,
      bottomNavigation: _bottomNavigation(),
    );
  }

  //홈화면 appBar
  PreferredSizeWidget _homeAppBar() {
    return AppBar(
      toolbarHeight: 120,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            '일동미라주',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '이동희 관리자님',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          SearchField(
            hintText: '차량 번호',
            readOnly: true,
          ),
          SizedBox(height: 8),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  //home화면 floating 버튼
  Widget _homeFloatingActionButton(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FloatingActionButton.extended(
        onPressed: () {
          context.push('/add/resident');
        },
        icon: Icon(
          Icons.add,
          color: PRIMARY_COLOR,
        ),
        label: Text(
          '입주 차량',
          style: TextStyle(
            fontSize: 14,
            color: PRIMARY_COLOR,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(width: 2, color: PRIMARY_COLOR),
        ),
        backgroundColor: Colors.white,
        elevation: 1.5,
        splashColor: BACKGROUND_GREY_LIGHT_COLOR,
      ),
    );
  }

  //하단 네비게이션
  Widget _bottomNavigation() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        showUnselectedLabels: true,
        unselectedItemColor: DEACTIVATE_TEXT_COLOR,
        unselectedFontSize: 10.0,
        fixedColor: PRIMARY_COLOR,
        selectedFontSize: 10.0,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          tabController.animateTo(index);
          setState(() {});
        },
        currentIndex: tabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
