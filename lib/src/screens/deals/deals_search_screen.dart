import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import '../../widgets/common/app_bar/custom_search_app_bar.dart';
import '../../widgets/deals/deals_search_list_view.dart';

class DealsSearchScreen extends StatelessWidget {
  static const navigatorId = '/total_deals_screen';
  final SearchDealsController searchDealsController =
  Get.find<SearchDealsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(controller: searchDealsController,hintText: 'deals.search'.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DealsSearchListView(),
        ),
      ),
    );
  }
}
