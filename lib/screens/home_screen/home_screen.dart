import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/core/app_constants.dart';
import 'package:lucky_browser/screens/home_screen/home_provider.dart';
import 'package:provider/provider.dart';

import 'components/shortcut_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder:
          (BuildContext context, HomeProvider homeProvider, Widget? child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.globalHorizontalPadding,
            vertical: AppConstants.globalVerticalPadding,
          ),
          child: Wrap(
            spacing: 32.w,
            runSpacing: 20.h,
            alignment: WrapAlignment.spaceBetween,
            children: [
              ...homeProvider.shortcuts
                  .map(
                    (shortcut) => ShortcutCard(shortcut: shortcut),
                  )
                  .toList(),
                  Container(
                      padding: EdgeInsets.all(
                        8.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 28.w,
                        color: Colors.blue,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
