import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_browser/models/shortcut_model.dart';

class ShortcutCard extends StatelessWidget {
  final ShortcutModel shortcut;
  const ShortcutCard({super.key, required this.shortcut});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: shortcut.url)));
        log('Opening ${shortcut.name}');
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              8.w,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Image.network(
              'http://www.google.com/s2/favicons?domain=${shortcut.url}&sz=64',
              width: 28.w,
              height: 28.h,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.language,
                  color: Colors.grey,
                  size: 32.w,
                );
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            shortcut.name,
          ),
        ],
      ),
    );
  }
}
