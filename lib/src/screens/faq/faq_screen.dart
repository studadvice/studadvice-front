import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class FaqScreen extends StatelessWidget {
  static const navigatorId = '/faq_screen';
  final SearchFaqController searchFaqController =
      Get.find<SearchFaqController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: CustomSearchAppBar(
              controller: searchFaqController, hintText: 'faq.search'.tr),
          body: const Padding(
            padding: EdgeInsets.all(10),
            child: FaqListView(),
          )),
    );
  }
}
