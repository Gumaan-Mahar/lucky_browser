import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/core/app_constants.dart';
import 'package:lucky_browser/screens/main_screen/components/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_screen.dart';
import '../web_view_screen/web_view_screen.dart';
import 'main_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder:
          (BuildContext context, MainProvider mainProvider, Widget? child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(
                AppConstants.getScreenWidth(context),
                45.h,
              ),
              child: CustomAppBar(
                mainProvider: mainProvider,
              ),
            ),
            // body: mainProvider.shouldDisplayWebView
            //     ? const WebViewScreen()
            //     : const HomeScreen(),
            body: mainProvider.tabs[mainProvider.selectedTabIndex].url == null
                ? const HomeScreen()
                : const WebViewScreen(),
          ),
        );
      },
    );
  }
}
