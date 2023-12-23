import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  final getLocalStorage = GetStorage();

  void toggleTheme(bool value) async {
    isDarkTheme(value);
    Get.changeThemeMode(getThemeMode());
    await getLocalStorage.write('isDarkTheme', value);
  }

  bool isDarkThemeFromStorage() {
    return getLocalStorage.read('isDarkTheme') ?? false;
  }

  ThemeMode getThemeMode() {
    return isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;
  }
}
