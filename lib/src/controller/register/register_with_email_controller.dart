import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';

class RegisterWithEmailController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  var agreeWithTermsAndConditions = false.obs;

  final String error = "Erreur de connexion";
  final String registerWithEmailFailed =
      "Une erreur s'est produite lors de l'inscription";
  final String alreadyHaveAnAccount =
      "Un compte existe déjà avec cette adresse email";

  void handleRegisterWithEmail(formData) async {
    _authenticationController.loadingSpinner();

    try {
      bool signUpSuccess = await _authenticationController.signUp(
        formData['email'],
        formData['hashedPassword'],
      );

      if (signUpSuccess) {
        _authenticationController.stopLoadingSpinner();

        Get.to(() => const RegisterUserInformationScreen(),
            arguments: formData);
      }
    } on FirebaseAuthException catch (e) {
      _authenticationController.stopLoadingSpinner();

      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          error,
          alreadyHaveAnAccount,
          backgroundColor: AppColors.dangerColor,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
        );
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
