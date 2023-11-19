import 'package:flutter/material.dart';

class NavigationHelper {
  void navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}
