import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stud_advice/src/utils/custom_locale.dart';

class I18n extends GetxController {
  CustomLocale _locale = CustomLocale('en', 'US'); // TODO update default locale
  Map<String, dynamic> _keysAndValues = {};
  final box = GetStorage();

  void changeLocale(Locale locale, [String? route]) async {
    // TODO :  refacto this
    _locale = CustomLocale(locale.languageCode, locale.countryCode);
    if (route != null) {
      await loadTranslations(route);
      Get.updateLocale(_locale);
      return;
    }
    Get.updateLocale(_locale);
    update();
  }

  CustomLocale get getCurrentLocale => _locale;

  Future<Map<String, dynamic>> _loadScreenTranslations(
      String screen, String locale) async {
    if (screen == 'default') return {};
    final path = 'assets/i18n$screen/$locale.json';
    return await rootBundle
        .loadString(path)
        .then((value) => json.decode(value))
        .catchError((e) {
      // TODO :  refacto this
      debugPrint('Error while loading translations for $screen : $e');
      return {'error': 'Error while loading translations for $screen : $e'};
    });
  }

  Future<void> loadTranslations(String route) async {
    String locale = '${_locale.languageCode}_${_locale.countryCode}';
    String cacheEntry = '${route}_$locale';
    if (box.read(cacheEntry) == null) {
      await _loadScreenTranslations(route, locale).then((value) async {
        _keysAndValues = value;
        await box.write(cacheEntry, value);
        update();
      });
    } else {
      _keysAndValues = box.read(cacheEntry);
      update();
    }
  }

  String text(String key, [Map<String, dynamic>? params]) {
    var keys = key.split('.');
    var currentMap = _keysAndValues;
    String? text;

    for (var k in keys) {
      if (currentMap[k] is Map) {
        currentMap = currentMap[k];
      } else {
        text = currentMap[k];
        break;
      }
    }

    text ??= key; // Default to key if text is not found

    if (params != null) {
      params.forEach((paramKey, value) {
        text = text!.replaceAll('@$paramKey', value.toString());
      });
    }

    return text ?? key; // Fallback to key if text is still null
  }
}
