import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore.dart';
import 'package:stud_advice/src/controllers/common/navbar_controller.dart';
import 'package:stud_advice/src/screens/screens.dart';

import '../faq/faq_screen.dart';

class NavigationBarScreen extends StatelessWidget {
  static const navigatorId = '/navigation_bar_screen';
  final NavBarController navbarController = Get.find<NavBarController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: navbarController.tabIndex,
          children: [
            FaqScreen(),
            DealsScreen(),
            HomePageScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: navbarController.changeTabIndex,
            currentIndex: navbarController.tabIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: AppColors.primaryColor,
            items: [
              _bottomNavigationBarItem(icon: Icons.question_answer, label: 'faq'),
              _bottomNavigationBarItem(icon: Icons.local_offer, label: 'deals'),
              _bottomNavigationBarItem(icon: Icons.home, label: 'home'),
              _bottomNavigationBarItem(icon: Icons.settings, label: 'settings')
            ]),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
