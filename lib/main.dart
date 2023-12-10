import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/core/app_theme.dart';

import 'package:lucky_browser/screens/home_screen/home_provider.dart';
import 'package:lucky_browser/screens/main_screen/main_provider.dart';
import 'package:lucky_browser/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

import 'screens/web_view_screen/web_view_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WebViewProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Lucky',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home: const MainScreen(),
          );
        });
  }
}
