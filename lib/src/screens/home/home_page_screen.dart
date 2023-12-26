import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/categories/search_category_controller.dart';
import 'package:stud_advice/src/widgets/categories/categories_list_view.dart';
import 'package:stud_advice/src/widgets/common/app_bar/custom_app_bar.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  final SearchCategoryController categoryController =
      Get.find<SearchCategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(controller: categoryController),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CategoriesListView(),
        ),
      ),
    );
  }
}
