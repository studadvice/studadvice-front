import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class CustomLocale extends Locale {

  CustomLocale(super.languageCode, [super.countryCode]);

  @override
  String toString() {
    return languageNames[languageCode] ?? languageCode;
  }
}
