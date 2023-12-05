import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class LegalTermsScreen extends StatelessWidget {
  static const String navigatorId = '/legal_terms_screen';
  final I18n _i18n = Get.find();

  String getTerms() {
    String terms = _i18n.text('header');
    for (int i = 1; i <= 8; i++) {
      terms += _i18n.text('article$i');
    }
    return terms + _i18n.text('footer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _i18n.text('title'),
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
