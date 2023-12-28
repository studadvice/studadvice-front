import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import '../../controllers/deals/deals_controller.dart';
import '../../widgets/common/app_bar/custom_search_app_bar.dart';
import '../../widgets/deals/deals_list_view.dart';

class DealsScreen extends StatelessWidget {
  static const navigatorId = '/deals_screen';
  final DealsController dealsController =
  Get.find<DealsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(controller: dealsController,hintText: 'search'.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DealsListView(),
        ),
      ),
    );
  }
}
