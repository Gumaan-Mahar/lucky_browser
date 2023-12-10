import 'package:flutter/material.dart';
import 'package:lucky_browser/models/tab_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainProvider extends ChangeNotifier {
  final TextEditingController urlTextController = TextEditingController();

  bool _shouldDisplayWebView = false;

  set shouldDisplayWebView(bool value) {
    _shouldDisplayWebView = value;
    notifyListeners();
  }

  bool get shouldDisplayWebView => _shouldDisplayWebView;

  final List<TabModel> tabs = <TabModel>[];

  void addTab(TabModel tab) {
    tabs.add(tab);
    notifyListeners();
  }

  void removeTab(TabModel tab) {
    tabs.remove(tab);
    notifyListeners();
  }

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));
}
