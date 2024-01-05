import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterOptionsScreen extends StatelessWidget {
  static const String navigatorId = '/register_options_screen';

  final SocialSignInController _socialSignInController = Get.find();
  final LegalTermsController _termsAndConditionsController = Get.find();

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
            'register.acceptingTermsAndConditions'.tr,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _termsAndConditionsController
            .buildTermsAndConditionsButton('register.legalConditionsButton'.tr),
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
                      buttonText: 'register.continueWithGoogle'.tr,
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
                      buttonText: 'register.continueWithFacebook'.tr,
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
                        buttonText: 'register.continueWithApple'.tr,
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
                  DividerWithText(text: 'register.dividerText'.tr),
                  const SizedBox(height: 20),
                  RegisterWithEmailButton(
                    text: 'register.continueWithEmail'.tr,
                    onPressed: () {
                      Get.toNamed(RegisterWithEmailScreen.navigatorId);
                    },
                    textColor: AppColors.white,
                    backgroundColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColorAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
