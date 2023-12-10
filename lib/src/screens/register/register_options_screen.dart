import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterOptionsScreen extends StatelessWidget {
  static const String navigatorId = '/register_options_screen';

  final I18n _i18n = Get.find<I18n>();

  final SocialSignInController _socialSignInController =
      Get.put(SocialSignInController());
  final LegalTermsController _termsAndConditionsController =
      Get.put(LegalTermsController());

  Widget buildSocialButton(
      {required String imagePath,
      required String buttonText,
      required VoidCallback onTap,
      required BuildContext context,
      Color? iconColor}) {
    return SocialButton(
      width: MediaQuery.of(context).size.width * 0.8,
      imagePath: imagePath,
      tileBackgroundColor: AppColors.white,
      borderColor: Colors.grey,
      iconColor: iconColor,
      buttonText: buttonText,
      onTap: onTap,
      borderRadius: 25,
      imageSize: 20,
      padding: 30,
    );
  }

  Widget buildTermsAndConditionsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            _i18n.text('acceptingTermsAndConditions'),
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _termsAndConditionsController
            .buildTermsAndConditionsButton(_i18n.text('legalConditionsButton')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialButton(
                      context: context,
                      imagePath: 'assets/images/login/google.png',
                      buttonText: _i18n.text('continueWithGoogle'),
                      onTap: () async {
                        if (await _socialSignInController
                            .loginWithGoogleAccount()) {
                          Get.toNamed(RegisterUserInformationScreen.navigatorId,
                              arguments: {
                                'hasAcceptedTermsAndConditions': true,
                              });
                        }
                      }),
                  const SizedBox(height: 20),
                  buildSocialButton(
                      context: context,
                      imagePath: 'assets/images/login/facebook.png',
                      buttonText: _i18n.text('continueWithFacebook'),
                      iconColor: Colors.blue,
                      onTap: () async {
                        if (await _socialSignInController
                            .loginWithFacebookAccount()) {
                          Get.toNamed(RegisterUserInformationScreen.navigatorId,
                              arguments: {
                                'hasAcceptedTermsAndConditions': true,
                              });
                        }
                      }),
                  if (Theme.of(context).platform == TargetPlatform.iOS)
                    const SizedBox(height: 20),
                  if (Theme.of(context).platform == TargetPlatform.iOS)
                    buildSocialButton(
                        context: context,
                        imagePath: 'assets/images/login/apple.png',
                        buttonText: _i18n.text('continueWithApple'),
                        onTap: () async {
                          if (await _socialSignInController
                              .loginWithAppleAccount()) {
                            Get.toNamed(
                                RegisterUserInformationScreen.navigatorId,
                                arguments: {
                                  'hasAcceptedTermsAndConditions': true,
                                });
                          }
                        }),
                  // const SizedBox(height: 20),
                  // buildSocialButton(
                  //     imagePath: 'assets/images/login/x.png',
                  //     buttonText: continueWithXText,
                  //     onTap: () async {
                  //       if (await _socialSignInController.loginWithXAccount()) {
                  //       Get.toNamed(RegisterUserInformationScreen.navigatorId,
                  //                               arguments: {
                  //                                 'hasAcceptedTermsAndConditions': true,
                  //                               });
                  //       }
                  //     }),
                  const SizedBox(height: 10),
                  buildTermsAndConditionsSection(),
                  const SizedBox(height: 20),
                  DividerWithText(text: _i18n.text('dividerText')),
                  const SizedBox(height: 20),
                  RegisterWithEmailButton(
                    onPressed: () {
                      Get.toNamed(RegisterWithEmailScreen.navigatorId);
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
