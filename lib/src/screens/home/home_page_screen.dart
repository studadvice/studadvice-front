import 'package:flutter/material.dart';
import '../../../stud_advice.dart';
import '../../widgets/common/bar/custom_app_bar.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CategoriesListView(),
        ),
      ),
    );
  }
}