import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/controllers/language_controller.dart';

class TranslationsMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print('TranslationsMiddleware: redirecting to $route');
    final languageController = Get.find<LanguageController>();
    // Assuming route names are the same as screen identifiers
    languageController.loadScreenTranslations(route ?? '');
    // return super.redirect(route);
    return null;

  }
}
