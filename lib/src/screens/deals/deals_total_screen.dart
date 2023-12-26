import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/common/app_bar/custom_app_bar.dart';
import '../../controllers/deals/search_total_deals_controller.dart';
import '../../widgets/deals/deals_list_view.dart';

class DealsTotalScreen extends StatelessWidget {
  static const navigatorId = '/total_deals_screen';
  final SearchTotalDealsController searchTotalDealsController =
  Get.find<SearchTotalDealsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(controller: searchTotalDealsController,hintText: "Search deals"),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: DealsListView(),
        ),
      ),
    );
  }
}
