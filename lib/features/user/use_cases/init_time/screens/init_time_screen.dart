import 'package:flutter/material.dart';

import '../../../../../common/chore/app_colors.dart';
import '../../../../../common/conf/injection_container.dart';
import '../services/init_time_service.dart';
import '../widgets/connection_button.dart';

class InitTimeScreen extends StatelessWidget {
  static const String navigatorId = 'init_time_screen';

  const InitTimeScreen({Key? key}) : super(key: key);

  final String loginText = 'Se connecter';
  final String registerText = 'S\'inscrire';

  @override
  Widget build(BuildContext context) {
    InitTimeService initTimeService = locator<InitTimeService>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
      child: ConnectionButton(
        text: text,
        textColor: textColor,
        backgroundColor: AppColors.backgroundColor,
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
          textColor: Colors.black,
          onTap: () {
            initTimeService.navigateToRegisterPage(context);
          },
          margin: const EdgeInsets.only(bottom: 350, left: 10, right: 10),
        ),
        buildImage(
          imagePath: 'assets/images/common/raven_image.png',
          height: 235,
          width: 235,
          margin: const EdgeInsets.only(bottom: 400, left: 60, right: 80),
        ),
        buildConnectionButton(
          text: loginText,
          textColor: Colors.black,
          onTap: () {
            initTimeService.navigateToLoginPage(context);
          },
          margin: const EdgeInsets.only(bottom: 250, left: 10, right: 10),
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
          textColor: Colors.black,
          onTap: () {
            initTimeService.navigateToRegisterPage(context);
          },
          margin: const EdgeInsets.only(bottom: 110, left: 100, right: 100),
        ),
        buildImage(
          imagePath: 'assets/images/common/raven_image.png',
          height: 170,
          width: 170,
          margin: const EdgeInsets.only(bottom: 170, left: 60, right: 80),
        ),
        buildConnectionButton(
          text: loginText,
          textColor: Colors.black,
          onTap: () {
            initTimeService.navigateToLoginPage(context);
          },
          margin: const EdgeInsets.only(bottom: 20, left: 100, right: 100),
        ),
      ],
    );
  }
}
