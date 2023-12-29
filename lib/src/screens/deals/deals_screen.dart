import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class DealsScreen extends StatelessWidget {
  static const navigatorId = '/deals_screen';
  final DealsController dealsController = Get.find<DealsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(
          controller: dealsController, hintText: 'deals.search'.tr),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DealsListView(),
        ),
      ),
    );
  }
}
