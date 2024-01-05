import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterWithEmailController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  void handleRegisterWithEmail(formData) async {
    LoadingSpinner.start();

    try {
      bool signUpSuccess =
          await _authenticationController.signUpWithEmailAndPassword(
        formData['email'],
        formData['hashedPassword'],
      );

      if (signUpSuccess) {
        LoadingSpinner.stop();

        Get.toNamed(RegisterUserInformationScreen.navigatorId, arguments: {
          'hasAcceptedTermsAndConditions':
              formData['hasAcceptedTermsAndConditions']
        });
      }
    } on FirebaseAuthException catch (e) {
      LoadingSpinner.stop();

      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "register_with_email_controller.alreadyHaveAnAccountError".tr,
          "register_with_email_controller.alreadyHaveAnAccount".tr,
          backgroundColor: AppColors.primaryColor,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
        );
        // We do not need to save the email and the password because it is already saved by firebase during the sign up process.
        // We just need to save the fact that the user has accepted the terms and conditions.
        // Get.toNamed(RegisterUserInformationScreen.navigatorId, arguments: {
        //   'hasAcceptedTermsAndConditions':
        //       formData['hasAcceptedTermsAndConditions']
        // });
      } else {
        Get.snackbar(
          "register_with_email_controller.error".tr,
          "register_with_email_controller.registerWithEmailFailed".tr,
          colorText: AppColors.white,
          backgroundColor: AppColors.dangerColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "register_with_email_controller.error".tr,
            style: const TextStyle(color: AppColors.white),
          ),
        );
      }
    }
  }
}
