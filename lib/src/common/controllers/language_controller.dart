import 'dart:ui';

import 'package:get/get.dart';
import 'package:stud_advice/src/common/translations/screen_translations.dart';

class LanguageController extends GetxController {
  ScreenTranslations? _currentTranslations;
  Locale _locale = const Locale('en','US'); // Default locale

  // Method to change the language
  void changeLocale(String languageCode, String countryCode) {
    _locale = Locale(languageCode, countryCode);
    Get.updateLocale(_locale);
    update(); // Notify listeners about the change
  }

  // Method to retrieve the current language
  Locale get getCurrentLocale => _locale;

  ScreenTranslations? get getCurrentTranslations => _currentTranslations;

  Future<void> loadScreenTranslations(String screen) async {
    _currentTranslations = ScreenTranslations(screen);
    await _currentTranslations!.loadTranslations();
    print('Loaded translations for $screen');
    print(_currentTranslations!.keys);
    update();
  }
}
