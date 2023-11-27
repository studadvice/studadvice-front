
import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/supported_locales.dart';

class CustomLocale extends Locale {

  CustomLocale(super.languageCode, [super.countryCode]);

  @override
  String toString() {
    return languageNames[languageCode] ?? languageCode;
  }
}
