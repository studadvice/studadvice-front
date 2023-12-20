import 'package:get/get.dart';

import 'en.dart';
import 'fr.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': Fr().messages,
        'en_US': En().messages,
      };
}
