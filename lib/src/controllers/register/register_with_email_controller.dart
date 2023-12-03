import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterWithEmailController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  final String error = "Erreur de connexion";
  final String alreadyHaveAnAccountError = "Vous avez déjà un compte";
  final String registerWithEmailFailed =
      "Une erreur s'est produite lors de l'inscription";
  final String alreadyHaveAnAccount =
      "Un compte existe déjà avec cette adresse email \n Veuillez continuer votre inscription";

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

        Get.to(() => const RegisterUserInformationScreen(), arguments: {
          'hasAcceptedTermsAndConditions':
              formData['hasAcceptedTermsAndConditions']
        });
      }
    } on FirebaseAuthException catch (e) {
      LoadingSpinner.stop();

      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          alreadyHaveAnAccountError,
          alreadyHaveAnAccount,
          backgroundColor: AppColors.blue,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
        );
        // We do not need to save the email and the password because it is already saved by firebase during the sign up process.
        // We just need to save the fact that the user has accepted the terms and conditions.
        Get.to(() => const RegisterUserInformationScreen(), arguments: {
          'hasAcceptedTermsAndConditions':
              formData['hasAcceptedTermsAndConditions']
        });
      } else {
        Get.snackbar(
          error,
          registerWithEmailFailed,
          colorText: AppColors.white,
          backgroundColor: AppColors.dangerColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            error,
            style: const TextStyle(color: AppColors.white),
          ),
        );
      }
    }
  }
}
