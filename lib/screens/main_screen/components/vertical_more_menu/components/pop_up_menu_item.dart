import 'package:flutter/material.dart';

PopupMenuItem<String> popupMenuItem({
  required IconData icon,
  required String title,
}) {
  return PopupMenuItem<String>(
    child: ListTile(
      leading: Icon(icon),
      title: Text(title),
    ),
  );
}
