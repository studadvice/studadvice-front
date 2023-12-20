import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stud_advice/stud_advice.dart';

class LegalTermsScreen extends StatelessWidget {
  static const String navigatorId = '/legal_terms_screen';

  String getTerms() {
    var box = GetStorage();
    var locale = Get.locale;
    return box.read('legal_terms_${locale?.languageCode}_${locale?.countryCode}') ?? 'Error loading legal terms';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'legal_terms.title'.tr,
          style: const TextStyle(
            fontSize: AppFontSizes.large18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          getTerms(),
          style: const TextStyle(fontSize: AppFontSizes.medium),
        ),
      ),
    );
  }
}
