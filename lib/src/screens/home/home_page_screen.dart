import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';

  @override
  Widget build(BuildContext context) {
    // return GetBuilder(
      // builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const SizedBox(
              height: 40,
              child: Image(
                image: AssetImage('assets/images/common/raven_image.png'),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to the Home Page!',
                  style: TextStyle(
                    fontSize: AppFontSizes.extraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton(
                    text: "Settings",
                    textColor: AppColors.white,
                    backgroundColor: AppColors.dangerColor,
                    onPressed: () {
                      Get.toNamed(SettingsScreen.navigatorId);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      // },
    // );
  }
}
