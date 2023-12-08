import 'package:flutter/material.dart';
import 'package:lucky_browser/models/shortcut_model.dart';

class HomeProvider extends ChangeNotifier {
  final TextEditingController urlTextController = TextEditingController();
  
  List<ShortcutModel> shortcuts = [
    ShortcutModel(
        name: 'Google', url: 'https://www.google.com', icon: Icons.search),
    ShortcutModel(
        name: 'YouTube',
        url: 'https://www.youtube.com',
        icon: Icons.video_library),
    ShortcutModel(
        name: 'Facebook',
        url: 'https://www.facebook.com',
        icon: Icons.facebook),
    ShortcutModel(
        name: 'Twitter',
        url: 'https://www.twitter.com',
        icon: Icons.bookmark_added_outlined),
  ];
}
