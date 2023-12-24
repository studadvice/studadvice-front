import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/deals/search_deals_controller.dart';
import 'package:stud_advice/src/widgets/common/app_bar/custom_app_bar.dart';
import '../../widgets/deals/deals_list_view.dart';

class TotalDealsScreen extends StatelessWidget {
  static const navigatorId = '/total_deals_screen';
  final SearchDealsController searchDealsController =
  Get.find<SearchDealsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(controller: searchDealsController),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: DealsListView(),
        ),
      ),
    );
  }
}
