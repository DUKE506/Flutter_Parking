import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final String? title;
  final Widget? bottomNavigation;
  final Color backgroudColor;
  final Widget body;

  const DefaultLayout({
    super.key,
    this.title,
    this.bottomNavigation,
    this.backgroudColor = Colors.white,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: _appBar(),
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: bottomNavigation,
    );
  }

  AppBar? _appBar() {
    if (title == null) {
      return null;
    }
    return AppBar(
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
