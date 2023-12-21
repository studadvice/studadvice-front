import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../stud_advice.dart';
import '../../widgets/common/bar/custom_app_bar.dart';

class HomePageScreen extends StatelessWidget {

  static const navigatorId = '/home_page_screen';
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar<CategoryController>(controller: categoryController),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CategoriesListView(),
        ),
      ),
    );
  }
}
