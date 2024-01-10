import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/controllers/common/navbar_controller.dart';
import 'package:stud_advice/src/screens/settings/change_user_data_screen.dart';
import 'package:stud_advice/stud_advice.dart';

import '../faq/faq_screen.dart';

class NavigationBarScreen extends StatelessWidget {
  static const navigatorId = '/navigation_bar_screen';
  final NavBarController navbarController = Get.find<NavBarController>();
  final UserStorageController userStorageController =
      Get.find<UserStorageController>();

  @override
  Widget build(BuildContext context) {
    _checkAndNotifyUserData();
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
              _bottomNavigationBarItem(
                  icon: Icons.question_mark_outlined, label: 'faq'),
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

  _checkAndNotifyUserData() async {
    String userId = userStorageController.getCurrentUserId();

    if (!await userStorageController.hasFilledUserData(userId)) {
      Get.snackbar(
          'notification.fillUserData'.tr, 'notification.fillUserDataMessage'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.white,
          duration: const Duration(seconds: 1),
          mainButton: TextButton(
            onPressed: () {
              Get.toNamed(ChangeUserDataScreen.navigatorId);
            },
            child: Text('notification.fillUserDataButton'.tr),
          ));
    }
  }
}
