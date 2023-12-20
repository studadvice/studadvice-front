import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  final box = GetStorage();

  void toggleTheme(bool value) async {
    isDarkTheme(value);
    Get.changeThemeMode(getThemeMode());
    await box.write('isDarkTheme', value);
  }

  bool isDarkThemeFromStorage() {
    return box.read('isDarkTheme') ?? false;
  }

  ThemeMode getThemeMode() {
    return isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;
  }
}
