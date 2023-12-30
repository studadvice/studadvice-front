import 'package:deepl_dart/deepl_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DeeplTranslatorController {
  static String deeplApiKey = dotenv.env["DEEPL_API_KEY"] ?? "DEEPL_API_KEY";
  final deeplTranslatorService = Translator(authKey: deeplApiKey);

  Future<void> translateText(String text, String targetLang) async {
    TextResult result =
        await deeplTranslatorService.translateTextSingular('Hello World', 'fr');
    debugPrint(result.text);

    // Translate list of texts
    List<TextResult> results = await deeplTranslatorService.translateTextList(
        ['Bonjour ici', 'Inscription à des programmes de prévention santé...'],
        'en');
    debugPrint(results.toString());
  }
}
