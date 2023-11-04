import 'package:flutter/material.dart';
import 'package:stud_advice/common/colors/app_colors.dart';

import '../../components/connection_button.dart';

class InitTimeScreen extends StatefulWidget {
  static const String navigatorId = 'init_time_screen';

  const InitTimeScreen({Key? key}) : super(key: key);

  @override
  State<InitTimeScreen> createState() => _InitTimeScreenState();
}

void doNothing() {}

class _InitTimeScreenState extends State<InitTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: Stack(
          // Used specifically to position to raven on top of the first connection button.
          children: [
            Positioned(
              bottom: 350,
              left: 10,
              right: 10,
              child: ConnectionButton(
                text: 'S\'inscrire',
                textColor: Colors.black,
                backgroundColor: AppColors.backgroundColor,
                borderColor: AppColors.secondaryColor,
                onTap:
                    doNothing, // TODO: Add navigation to the registration page.
              ),
            ),
            Positioned(
              bottom: 400,
              left: 60,
              right: 80,
              child: Image(
                image: AssetImage('assets/images/common/raven_image.png'),
              ),
            ),
            Positioned(
              bottom: 250,
              left: 10,
              right: 10,
              child: ConnectionButton(
                  text: 'Se connecter',
                  textColor: Colors.black,
                  backgroundColor: AppColors.backgroundColor,
                  borderColor: AppColors.secondaryColor,
                  onTap: doNothing // TODO: Add navigation to the login page.
                  ),
            ),
          ],
        )));
  }
}
