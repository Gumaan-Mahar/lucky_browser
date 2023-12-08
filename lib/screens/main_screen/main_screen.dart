import 'package:flutter/material.dart';
import 'package:lucky_browser/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_provider.dart';
import 'main_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Consumer<MainProvider>(
      builder: (BuildContext context, MainProvider mainProvider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: homeProvider.urlTextController,
              decoration: InputDecoration(
                hintText: 'Enter URL',
              ),
              onSubmitted: (url) async {
                // await mainProvider.controller.loadRequest(Uri.parse());
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () async {
                  if (await mainProvider.controller.canGoBack()) {
                    mainProvider.controller.goBack();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () async {
                  if (await mainProvider.controller.canGoForward()) {
                    mainProvider.controller.goForward();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  mainProvider.controller.reload();
                },
              ),
            ],
          ),
          body: HomeScreen(),
        );
      }
    );
  }
}
