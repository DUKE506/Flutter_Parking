import 'package:flutter/material.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/view/root_tab.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: TEXT_COLOR),
          bodyMedium: TextStyle(color: TEXT_COLOR),
          bodySmall: TextStyle(color: TEXT_COLOR),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: RootTab(),
    );
  }
}
