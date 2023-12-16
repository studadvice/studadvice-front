import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stud_advice/stud_advice.dart';

class I18n extends GetxController {
  CustomLocale _locale =
      CustomLocale('fr', 'FR'); // TODO : update default locale
  final box = GetStorage();

  void changeLocale(Locale locale) async {
    _locale = CustomLocale(locale.languageCode, locale.countryCode);
    Get.updateLocale(_locale);
    await box.write('locale', _locale.toString());
  }

  CustomLocale get getCurrentLocale => _locale;
}
