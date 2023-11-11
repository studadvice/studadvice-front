import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/screens/register/register_with_email_screen.dart';
import 'package:stud_advice/src/screens/register/widgets/register_social_button.dart';
import 'package:stud_advice/src/screens/register/widgets/register_with_email_button.dart';
import 'package:stud_advice/src/widgets/dividers/divider_with_text.dart';

class RegisterOptionsScreen extends StatefulWidget {
  static const String navigatorId = 'register_screen_options';

  const RegisterOptionsScreen({super.key});

  @override
  State<RegisterOptionsScreen> createState() => _RegisterOptionsScreenState();
}

class _RegisterOptionsScreenState extends State<RegisterOptionsScreen> {
  // Use constants to facilitate the implementation of the translation.
  final String dividerText = 'Ou';
  final String continueWithGoogleText = 'Continuer avec Google';
  final String continueWithFacebookText = 'Continuer avec Facebook';
  final String continueWithAppleText = 'Continuer avec Apple';
  final String continueWithXText = 'Continuer avec X';

  Widget buildSocialButton(
      {required String imagePath,
      required String buttonText,
      required VoidCallback onTap,
      Color? iconColor}) {
    return RegisterSocialButton(
      imagePath: imagePath,
      tileBackgroundColor: AppColors.white,
      borderColor: Colors.grey,
      iconColor: iconColor,
      buttonText: buttonText,
      onTap: onTap,
    );
  }

  Widget buildDividerWithText() {
    return Column(
      children: [
        const SizedBox(height: 20),
        DividerWithText(text: dividerText),
        const SizedBox(height: 30),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialButton(
                      imagePath: 'assets/images/login/google.png',
                      buttonText: continueWithGoogleText,
                      onTap: () {
                        // TODO Register with google
                      }),
                  const SizedBox(height: 20),
                  buildSocialButton(
                      imagePath: 'assets/images/login/facebook.png',
                      buttonText: continueWithFacebookText,
                      iconColor: Colors.blue,
                      onTap: () {
                        // TODO Register with facebook
                      }),
                  const SizedBox(height: 20),
                  buildSocialButton(
                      imagePath: 'assets/images/login/apple.png',
                      buttonText: continueWithAppleText,
                      onTap: () {
                        // TODO Register with apple
                      }),
                  const SizedBox(height: 20),
                  buildSocialButton(
                      imagePath: 'assets/images/login/x.png',
                      buttonText: continueWithXText,
                      onTap: () {
                        // TODO Register with x
                      }),
                  buildDividerWithText(),
                  RegisterWithEmailButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterWithEmailScreen()));
                    },
                    textColor: AppColors.white,
                    backgroundColor: AppColors.blue,
                    borderColor: AppColors.primaryColorAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
