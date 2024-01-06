import 'package:deepl_dart/deepl_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class DeeplTranslatorController {
  static const String defaultApiKey = "DEEPL_API_KEY";
  static String get deeplApiKey => dotenv.env["DEEPL_API_KEY"] ?? defaultApiKey;

  final Translator _deeplTranslatorService;

  DeeplTranslatorController(this._deeplTranslatorService);

  Future<String> translateText(String text) async {
    var locale = Get.locale ?? const Locale('fr', 'FR');

    if (locale.languageCode == 'fr') {
      return text; // In French, no need to translate.
    }

    String targetLang = '${locale.languageCode}_${locale.countryCode!}';

    TextResult result =
        await _deeplTranslatorService.translateTextSingular(text, targetLang);

    return result.text;
  }
}
