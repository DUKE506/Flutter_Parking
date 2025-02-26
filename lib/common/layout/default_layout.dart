import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String? title;
  final Widget? bottomNavigation;
  final Color backgroundColor;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomSheet;
  const DefaultLayout({
    super.key,
    this.title,
    this.bottomNavigation,
    this.backgroundColor = Colors.white,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _appBar(),
      //floating 액션버튼
      floatingActionButton: floatingActionButton,
      //floating 위치
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: bottomNavigation,
      bottomSheet: bottomSheet,
    );
  }

  AppBar? _appBar() {
    if (title == null) {
      return null;
    }
    return AppBar(
      centerTitle: true,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
    );
  }
}
