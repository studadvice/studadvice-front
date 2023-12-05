import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class InitTimeScreen extends StatelessWidget {
  static const String navigatorId = '/init_time_screen';
  final I18n _i18n = Get.find<I18n>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            buildImage(
              imagePath: 'assets/images/common/raven_image.png',
              height: 235,
              width: 235,
              margin: const EdgeInsets.only(top: 20),
            ),
            buildConnectionButton(
              text: _i18n.text('register'),
              textColor: AppColors.white,
              onPressed: () {
                Get.toNamed(RegisterOptionsScreen.navigatorId);
              },
            ),
            buildConnectionButton(
              text: _i18n.text('login'),
              textColor: AppColors.white,
              onPressed: () {
                Get.toNamed(LoginScreen.navigatorId);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildConnectionButton({
    required String text,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomButton(
          text: text,
          textColor: textColor,
          backgroundColor: AppColors.blue,
          onPressed: onPressed),
    );
  }

  Widget buildImage({
    required String imagePath,
    double? height,
    double? width,
    EdgeInsets? margin,
  }) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Image(
        image: AssetImage(imagePath),
        height: height,
        width: width,
      ),
    );
  }
}
