import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../stud_advice.dart';
import '../../controllers/faq/search_faq_controller.dart';
import '../../widgets/faq/faq_list_view.dart';

class FaqScreen extends StatelessWidget {
  static const navigatorId = '/faq_screen';
  final SearchFaqController searchFaqController =
  Get.find<SearchFaqController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomSearchAppBar(
            controller: searchFaqController, hintText: 'faq.search'.tr),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: FaqListView(),
        ));
  }
}
