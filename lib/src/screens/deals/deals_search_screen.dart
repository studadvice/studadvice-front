import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import 'package:stud_advice/stud_advice.dart';

class DealsSearchScreen extends StatelessWidget {
  static const navigatorId = '/total_deals_screen';
  final SearchDealsController searchDealsController =
      Get.find<SearchDealsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(
          controller: searchDealsController, hintText: 'deals.search'.tr),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: DealsSearchListView(),
        ),
      ),
    );
  }
}
