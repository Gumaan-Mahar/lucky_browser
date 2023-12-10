import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/core/app_colors.dart';
import 'package:lucky_browser/core/app_constants.dart';
import 'package:lucky_browser/core/global_text_style.dart';
import 'package:lucky_browser/methods/generate_random_id.dart';
import 'package:lucky_browser/models/tab_model.dart';
import 'package:lucky_browser/screens/main_screen/main_provider.dart';
import 'package:lucky_browser/screens/main_screen/subscreens/tabs_screen.dart';

import 'vertical_more_menu/vertical_more_menu.dart';

class CustomAppBar extends StatelessWidget {
  final MainProvider mainProvider;

  const CustomAppBar({
    Key? key,
    required this.mainProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 28.w,
      leading: IconButton(
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.home_outlined,
          size: 28.w,
        ),
        onPressed: () {},
      ),
      title: Row(
        children: [
          SizedBox(
            height: 40.h,
            width: AppConstants.getScreenWidth(context) * 0.56,
            child: TextField(
              controller: mainProvider.urlTextController,
              cursorColor: AppColors.primaryColor,
              cursorHeight: 14.h,
              style: globalTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ).copyWith(
                height: 1.2,
              ),
              decoration: InputDecoration(
                  hintText: 'Enter URL',
                  hintStyle: globalTextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyColor,
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 8.h,
                    left: 16.w,
                    right: 16.w,
                  ),),
              onSubmitted: (url) async {
                // await mainProvider.controller.loadRequest(Uri.parse(url));
                mainProvider.shouldDisplayWebView = true;
              },
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () => {
              mainProvider.addTab(
                TabModel(
                  id: generateRandomID(),
                ),
              ),
            },
            child: Icon(
              Icons.add,
              size: 22.w,
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabsScreen(),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 6.w,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyColor,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                mainProvider.tabs.length.toString(),
                style: globalTextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            child: Icon(
              Icons.more_vert_rounded,
              size: 22.h,
            ),
            onTap: () async {
              await verticalMoreMenu(
                context: context,
                mainProvider: mainProvider,
              );
            },
          ),
        ],
      ),
    );
  }
}
