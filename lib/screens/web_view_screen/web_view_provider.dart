import 'package:flutter/material.dart';

class WebViewProvider extends ChangeNotifier {
  int _webViewLoadingProgress = 0;
  bool _isWebViewLoading = false;

  set webViewLoadingProgress(int value) {
    _webViewLoadingProgress = value;
    notifyListeners();
  }

  int get webViewLoadingProgress => _webViewLoadingProgress;

  set isWebViewLoading(bool value) {
    _isWebViewLoading = value;
    notifyListeners();
  }

  bool get isWebViewLoading => _isWebViewLoading;
}
