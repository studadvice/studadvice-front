import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/pagination/list/categories_list_screen.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../repositories/stud_advice/stud_advice.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';

  @override
  Widget build(BuildContext context) {
    Get.put(StudAdviceRepository());
    // return GetBuilder(
      // builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
          ),
          body: Center(
            child: CategoriesListScreen(),
          ),
        );
      // },
    // );
  }
}
