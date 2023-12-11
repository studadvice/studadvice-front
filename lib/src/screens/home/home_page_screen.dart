import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/categories/categories_list_view.dart';
import 'package:stud_advice/src/widgets/search/CategoriesSearch.dart';
import 'package:stud_advice/stud_advice.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  final I18n _i18n = Get.find<I18n>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CategoriesSearch());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(SettingsScreen.navigatorId);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/common/raven_image.png'),
              ),
            ),
          )
        ],
      ),
      body: const Center(
        child: CategoriesListView(),
      ),
    );
    // },
    // );
  }

}
