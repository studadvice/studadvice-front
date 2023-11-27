import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/controllers/home/home_page_controller.dart';
import 'package:stud_advice/src/widgets/common/buttons/default_connection_button.dart';

class HomePageScreen extends StatelessWidget {
  static const navigatorId = '/home_page_screen';
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
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
                  child: DefaultConnectionButton(
                    text: "Se déconnecter",
                    textColor: AppColors.white,
                    backgroundColor: AppColors.dangerColor,
                    onPressed: () {
                      _homePageController.signOut();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
