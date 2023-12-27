import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore.dart';
import 'package:stud_advice/src/controllers/common/dashboard_controller.dart';
import 'package:stud_advice/src/screens/deals/deals_screen.dart';
import 'package:stud_advice/src/screens/screens.dart';

class DashboardScreen extends StatelessWidget {
  static const navigatorId = '/dashboard_screen';
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: dashboardController.tabIndex,
          children: [
            DealsScreen(),
            HomePageScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: dashboardController.changeTabIndex,
            currentIndex: dashboardController.tabIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: AppColors.primaryColor,
            items: [
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
