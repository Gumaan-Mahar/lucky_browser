import 'package:flutter/material.dart';
import 'package:lucky_browser/screens/home_screen/home_provider.dart';
import 'package:provider/provider.dart';

import '../main_screen/main_provider.dart';
import 'components/shortcut_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider = Provider.of<MainProvider>(context);
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return Consumer<HomeProvider>(builder:
        (BuildContext context, HomeProvider homeProvider, Widget? child) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: homeProvider.shortcuts.length,
        itemBuilder: (context, index) {
          return ShortcutCard(
            shortcut: homeProvider.shortcuts[index],
          );
        },
      );
    });
  }
}
