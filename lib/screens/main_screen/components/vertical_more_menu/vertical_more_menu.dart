import 'package:flutter/material.dart';
import 'package:lucky_browser/screens/main_screen/main_provider.dart';

import 'components/pop_up_menu_item.dart';

Future verticalMoreMenu({
  required BuildContext context,
  required MainProvider mainProvider,
}) async {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  return await showMenu(
    position: RelativeRect.fromRect(
      Rect.fromPoints(
        const Offset(double.infinity, 0),
        overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
      ),
      Offset.zero & overlay.size,
    ),
    context: context,
    items: [
      PopupMenuItem(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                // if (await mainProvider.webViewController!.canGoBack()) {
                //   await mainProvider.webViewController?.goBack();
                // }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () async {
                // if (await mainProvider.webViewController!.canGoForward()) {
                //   await mainProvider.webViewController?.goForward();
                // }
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () async {
                // await mainProvider.webViewController?.reload();
              },
            ),
          ],
        ),
      ),
      popupMenuItem(
        icon: Icons.add,
        title: 'New Tab',
      ),
      popupMenuItem(
        icon: Icons.lock_outline,
        title: 'New Incognito Tab',
      ),
      popupMenuItem(
        icon: Icons.history,
        title: 'History',
      ),
      popupMenuItem(
        icon: Icons.file_download_outlined,
        title: 'Downloads',
      ),
      popupMenuItem(
        icon: Icons.bookmarks_outlined,
        title: 'Bookmarks',
      ),
      popupMenuItem(
        icon: Icons.schedule,
        title: 'Recent Tabs',
      ),
      popupMenuItem(
        icon: Icons.share,
        title: 'Share',
      ),
      popupMenuItem(
        icon: Icons.search,
        title: 'Find in Page',
      ),
      popupMenuItem(
        icon: Icons.language,
        title: 'Translate',
      ),
      popupMenuItem(
        icon: Icons.add_to_home_screen,
        title: 'Add to Home Screen',
      ),
      popupMenuItem(
        icon: Icons.desktop_windows_outlined,
        title: 'Desktop Site',
      ),
      popupMenuItem(
        icon: Icons.settings,
        title: 'Settings',
      ),
      popupMenuItem(
        icon: Icons.help,
        title: 'Help & Feedback',
      ),
    ],
  );
}
