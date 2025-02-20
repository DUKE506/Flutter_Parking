import 'package:flutter/material.dart';
import 'package:flutter_parking/car/view/car_screen.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/layout/default_layout.dart';

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
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          CarScreen(),
          CarScreen(),
          CarScreen(),
        ],
      ),
      bottomNavigation: _bottomNavigation(),
    );
  }

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
