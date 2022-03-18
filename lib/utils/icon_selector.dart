import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class IconSelector {
  IconData getIcon(String name) {
    IconData icon;
    switch (name.toLowerCase()) {
      case "mobile money":
        icon = Icons.phone_android_rounded;
        break;
      case "bank":
        icon = FontAwesome.bank;
        break;
      default:
        icon = Icons.attach_money;
    }

    return icon;
  }
}
