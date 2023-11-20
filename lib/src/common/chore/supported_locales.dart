import 'package:stud_advice/utils/custom_locale.dart';

const french = 'fr';
const english = 'en';

const frenchCountry = 'FR';
const englishCountry = 'US';

const currentLanguage = french;
const currentCountry = frenchCountry;

final supportedLocales = [
  CustomLocale(english, englishCountry),
  CustomLocale(french, frenchCountry),
];
Map<String, String> languageNames = {
  'en': 'English',
  'en_US': 'English',
  'fr': 'French',
  'fr_FR': 'French',
};
