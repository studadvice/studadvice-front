import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/screens/init_time/widgets/init_time_connection_button.dart';
import 'package:stud_advice/src/services/init_time/init_time_service.dart';

class InitTimeScreen extends StatelessWidget {
  static const String navigatorId = '/init_time_screen';

  const InitTimeScreen({super.key});

  final String loginText = 'Se connecter';
  final String registerText = 'S\'inscrire';

  @override
  Widget build(BuildContext context) {
    InitTimeService initTimeService = Get.find<InitTimeService>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return buildPortraitLayout(initTimeService, context);
            } else {
              return buildLandscapeLayout(initTimeService, context);
            }
          },
        ),
      ),
    );
  }

  Widget buildConnectionButton({
    required String text,
    required Color textColor,
    required VoidCallback onTap,
    required EdgeInsets margin,
  }) {
    return Positioned(
      bottom: margin.bottom,
      left: margin.left,
      right: margin.right,
      child: InitTimeConnectionButton(
        text: text,
        textColor: textColor,
        backgroundColor: AppColors.blue,
        borderColor: AppColors.secondaryColor,
        onTap: onTap,
      ),
    );
  }

  Widget buildImage({
    required String imagePath,
    double? height,
    double? width,
    EdgeInsets? margin,
  }) {
    return Positioned(
      bottom: margin?.bottom,
      left: margin?.left,
      right: margin?.right,
      child: Image(
        image: AssetImage(imagePath),
        height: height,
        width: width,
      ),
    );
  }

  Widget buildPortraitLayout(
      InitTimeService initTimeService, BuildContext context) {
    return Stack(
      children: [
        buildConnectionButton(
          text: registerText,
          textColor: AppColors.white,
          onTap: () {
            initTimeService.navigateToRegisterPage(context);
          },
          margin: const EdgeInsets.only(bottom: 342, left: 50, right: 50),
        ),
        buildImage(
          imagePath: 'assets/images/common/raven_image.png',
          height: 235,
          width: 235,
          margin: const EdgeInsets.only(bottom: 370, left: 60, right: 80),
        ),
        buildConnectionButton(
          text: loginText,
          textColor: AppColors.white,
          onTap: () {
            initTimeService.navigateToLoginPage(context);
          },
          margin: const EdgeInsets.only(bottom: 250, left: 50, right: 50),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout(
      InitTimeService initTimeService, BuildContext context) {
    return Stack(
      children: [
        buildConnectionButton(
          text: registerText,
          textColor: AppColors.white,
          onTap: () {
            initTimeService.navigateToRegisterPage(context);
          },
          margin: const EdgeInsets.only(bottom: 110, left: 250, right: 250),
        ),
        buildImage(
          imagePath: 'assets/images/common/raven_image.png',
          height: 170,
          width: 170,
          margin: const EdgeInsets.only(bottom: 148, left: 60, right: 80),
        ),
        buildConnectionButton(
          text: loginText,
          textColor: AppColors.white,
          onTap: () {
            initTimeService.navigateToLoginPage(context);
          },
          margin: const EdgeInsets.only(bottom: 20, left: 250, right: 250),
        ),
      ],
    );
  }
}
