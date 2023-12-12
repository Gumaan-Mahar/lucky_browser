import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lucky_browser/screens/web_view_screen/web_view_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final WebViewController webViewController;
  const WebViewScreen({super.key, required this.webViewController});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewProvider>(
      builder: (BuildContext context, WebViewProvider webViewProvider,
          Widget? child) {
        return Stack(
          children: [
            WebViewWidget(
              controller: webViewController
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) => {
                      webViewProvider.webViewLoadingProgress = progress,
                    },
                    onPageStarted: (String url) {
                      webViewProvider.isWebViewLoading = true;
                      webViewProvider.webViewLoadingProgress = 0;
                    },
                    onPageFinished: (String url) {
                      webViewProvider.isWebViewLoading = false;
                      webViewProvider.webViewLoadingProgress = 100;
                    },
                    onWebResourceError: (WebResourceError error) {
                      webViewProvider.isWebViewLoading = false;
                      webViewProvider.webViewLoadingProgress = 0;
                      log(error.toString());
                    },
                    onNavigationRequest: (NavigationRequest request) {
                      if (request.url.startsWith('http')) {
                        return NavigationDecision.navigate;
                      }
                      return NavigationDecision.prevent;
                    },
                  ),
                )
                ..addJavaScriptChannel(
                  'Toaster',
                  onMessageReceived: (JavaScriptMessage message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message.message)),
                    );
                  },
                ),
            ),
            if (webViewProvider.webViewLoadingProgress < 100)
              LinearProgressIndicator(
                value: webViewProvider.webViewLoadingProgress / 100.0,
              )
          ],
        );
        //
      },
    );
  }
}
