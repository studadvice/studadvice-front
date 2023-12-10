import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../widgets/pagination/list/administrative-category-list-screen.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  final I18n _i18n = Get.find<I18n>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AdministrativeCategoryListScreen(),
      ),
    );
    // },
    // );
  }

}
