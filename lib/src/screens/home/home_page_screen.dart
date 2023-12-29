import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  final SearchCategoryController categoryController =
      Get.find<SearchCategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomSearchAppBar(
            controller: categoryController, hintText: 'categories.search'.tr),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: CategoriesListView(),
        ));
  }
}
