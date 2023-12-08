import 'package:flutter/material.dart';
import 'package:lucky_browser/models/shortcut_model.dart';

class ShortcutCard extends StatelessWidget {
  final ShortcutModel shortcut;
  const ShortcutCard({super.key, required this.shortcut});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Open the shortcut's URL
        // You can navigate to a WebView page or launch an external browser
        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: shortcut.url)));
        print('Opening ${shortcut.name}');
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(shortcut.icon, size: 48.0, color: Colors.blue),
            SizedBox(height: 8.0),
            Text(shortcut.name),
          ],
        ),
      ),
    );
  }
}
