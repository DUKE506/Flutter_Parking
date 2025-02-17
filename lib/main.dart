import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_parking/common/const/colors.dart';
import 'package:flutter_parking/common/navigation/router.dart';
import 'package:flutter_parking/common/view/root_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    //다크 모드 여부
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    //다크 모드에 따라 StatusBar 색상 변경
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkMode ? Colors.black : Colors.white,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        //statusBarBrightness 속성 - 다크모드 설정
      ),
    );
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        // fontFamily: 'NotoSans',
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: TEXT_COLOR),
          bodyMedium: TextStyle(color: TEXT_COLOR),
          bodySmall: TextStyle(color: TEXT_COLOR),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
