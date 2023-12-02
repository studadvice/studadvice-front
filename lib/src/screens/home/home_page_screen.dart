import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/helper/navigation_helper.dart';
import 'package:stud_advice/src/screens/settings/settings_screen.dart';
import 'package:stud_advice/src/widgets/common/buttons/custom_button.dart';

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
                      NavigationHelper.navigateTo(SettingsScreen.navigatorId);
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
