import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/screens/login/login_screen.dart';
import 'package:stud_advice/src/screens/register/register_options_screen.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';

class InitTimeScreen extends StatelessWidget {
  static const String navigatorId = '/init_time_screen';

  final String loginText = 'Se connecter';
  final String registerText = 'S\'inscrire';

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
              text: registerText,
              textColor: AppColors.white,
              onPressed: () {
                Get.to(() => RegisterOptionsScreen());
              },
            ),
            buildConnectionButton(
              text: loginText,
              textColor: AppColors.white,
              onPressed: () {
                Get.to(() => LoginScreen());
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
      child: DefaultConnectionButton(
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
