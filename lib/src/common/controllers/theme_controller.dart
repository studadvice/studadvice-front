import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;

  void toggleTheme(bool value) {
    isDarkTheme(value);
    Get.changeThemeMode(getThemeMode());
  }

  ThemeMode getThemeMode() {
    return isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;
  }
}
