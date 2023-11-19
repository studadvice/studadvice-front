import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ScreenTranslations extends Translations {
  final String screen;
  Map<String, Map<String, String>> _keys = {};

  ScreenTranslations(this.screen);

  @override
  Map<String, Map<String, String>> get keys => _keys;

  Future<Map<String, String>> loadScreenTranslations(String screen, String locale) async {
      if (screen == 'default') return {};
      print('Loading translations for $screen in $locale');
      final path = 'assets/translations/$screen/$locale.json';
      final jsonString = await rootBundle.loadString(path);
      return json.decode(jsonString).cast<String, String>();
  }

  Future<void> loadTranslations() async {
    _keys['en_US'] = await loadScreenTranslations(screen, 'en_US');
    _keys['fr_FR'] = await loadScreenTranslations(screen, 'fr_FR');
    // _keys['es'] = await loadScreenTranslations(screen, 'es');
  }
}

