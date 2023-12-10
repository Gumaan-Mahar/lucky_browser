import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/core/app_colors.dart';
import 'package:lucky_browser/core/app_constants.dart';
import 'package:lucky_browser/core/global_text_style.dart';
import 'package:lucky_browser/models/tab_model.dart';
import 'package:lucky_browser/screens/home_screen/home_screen.dart';
import 'package:lucky_browser/screens/main_screen/components/vertical_more_menu/components/pop_up_menu_item.dart';
import 'package:lucky_browser/screens/web_view_screen/web_view_screen.dart';
import 'package:provider/provider.dart';

import '../main_provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder:
        (BuildContext context, MainProvider mainProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 22.w,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'New tab',
                    style: globalTextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final RenderBox overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox;
                  await showMenu(
                    context: context,
                    position: RelativeRect.fromRect(
                      Rect.fromPoints(
                        const Offset(double.infinity, 0),
                        overlay.localToGlobal(
                            overlay.size.bottomRight(Offset.zero)),
                      ),
                      Offset.zero & overlay.size,
                    ),
                    items: [
                      popupMenuItem(
                          icon: Icons.add_box_outlined, title: 'New tab'),
                      popupMenuItem(
                          icon: Icons.private_connectivity_outlined,
                          title: 'New Incognito tab'),
                      popupMenuItem(icon: Icons.close, title: 'Close all tabs'),
                      popupMenuItem(icon: Icons.edit, title: 'Select tabs'),
                      popupMenuItem(icon: Icons.settings, title: 'Settings'),
                    ],
                  );
                },
                child: Icon(
                  Icons.more_vert,
                  size: 22.w,
                ),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.globalHorizontalPadding,
            vertical: AppConstants.globalVerticalPadding,
          ),
          itemCount: mainProvider.tabs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.w,
            mainAxisExtent: AppConstants.getScreenHeight(context) * 0.3,
          ),
          itemBuilder: (_, index) {
            final TabModel tab = mainProvider.tabs[index];
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(
                  20.r,
                ),
                border: Border.all(
                  color: AppColors.greyColor.withOpacity(
                    0.5,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.greyColor.withOpacity(0.2),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              size: 22.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            SizedBox(
                              width: 90.w,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  tab.url ?? 'New tab',
                                  overflow: TextOverflow.fade,
                                  style: globalTextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => {
                            mainProvider.removeTab(tab),
                          },
                          child: Icon(
                            Icons.close,
                            size: 20.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: tab.url == null
                            ? const HomeScreen()
                            : const WebViewScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
