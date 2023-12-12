import 'package:flutter/material.dart';
import 'package:lucky_browser/methods/generate_random_id.dart';
import 'package:lucky_browser/models/tab_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainProvider extends ChangeNotifier {
  final TextEditingController urlTextController = TextEditingController();

  final List<TabModel> tabs = <TabModel>[
    TabModel(
      id: generateRandomID(),
      url: null,
    ),
  ];
  int _selectedTabIndex = 0;

  final List<WebViewController> webViewControllers = <WebViewController>[];

  void addTab(TabModel tab) {
    tabs.add(tab);
    final controller = WebViewController();
    webViewControllers.add(controller);
    notifyListeners();
  }

  void updateTab(String? url) {
    tabs[selectedTabIndex].url = url;
    notifyListeners();
  }

  void removeTab(int index) {
    tabs.removeAt(index);
    webViewControllers.removeAt(index);
    notifyListeners();
  }

  set selectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }

  int get selectedTabIndex => _selectedTabIndex;

  MainProvider() {
    final controller = WebViewController();
    webViewControllers.add(controller);
  }

  @override
  void dispose() {
    urlTextController.dispose();
    super.dispose();
  }
}
