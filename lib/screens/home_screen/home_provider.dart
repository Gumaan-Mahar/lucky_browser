import 'package:flutter/material.dart';
import 'package:lucky_browser/models/shortcut_model.dart';

class HomeProvider extends ChangeNotifier {
  List<ShortcutModel> shortcuts = [
    ShortcutModel(
      name: 'Google',
      url: 'www.google.com',
    ),
    ShortcutModel(
      name: 'YouTube',
      url: 'www.youtube.com',
    ),
    ShortcutModel(
      name: 'Facebook',
      url: 'www.facebook.com',
    ),
    ShortcutModel(
      name: 'Twitter',
      url: 'www.twitter.com',
    ),
    ShortcutModel(
      name: 'Instagram',
      url: 'www.instagram.com',
    ),
    ShortcutModel(
      name: 'Pinterest',
      url: 'www.pinterest.com',
    ),
    ShortcutModel(
      name: 'Microsoft',
      url: 'www.microsoft.com',
    ),
  ];
}
