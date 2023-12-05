import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  final I18n _i18n = Get.find<I18n>();

  @override
  Widget build(BuildContext context) {
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
            // RoadMapScreen(
                //   currentStep: 1,
                //   stepCount: 5,
                // ),const Text(
              'Welcome to the Home Page!',
              style: TextStyle(
                fontSize: AppFontSizes.extraLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomButton(
                text: _i18n.text('settings'),
                textColor: AppColors.white,
                backgroundColor: AppColors.dangerColor,
                onPressed: () {
                  Get.toNamed(SettingsScreen.navigatorId);},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CustomButton(
                    text: "Roadmap",
                    textColor: AppColors.white,
                    backgroundColor: AppColors.primaryColorAccent,
                    onPressed: () {
                      Get.toNamed(RoadMapScreen.navigatorId);
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
