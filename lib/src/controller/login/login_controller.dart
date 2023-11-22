import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  var rememberMe = true.obs;

  final String error = "Erreur de connexion";
  final String loginWithEmailFailed =
      "Une erreur s'est produite lors de la connexion";
  final String invalidCredentials = "Email ou mot de passe incorrects";
  final String wrongPassword = "Mot de passe incorrect";
  final String userDisabled = "Le compte a été désactivé";
  final String userNotFound = "Le compte n'existe pas";

  Future<void> loginWithEmailAndPassword(
      String email, String hashedPassword) async {
    _authenticationController.loadingSpinner();

    try {
      bool signInSuccess = await _authenticationController.signIn(
        email,
        hashedPassword,
      );

      if (signInSuccess) {
        _authenticationController.stopLoadingSpinner();

        // After the user is connected, we redirect him to the home page.
        // Here we use the Get.offAll() method to remove all the previous screens
        // from the stack.
        // So the user can't go back to the login screen.
        Get.offAll(() => const HomePageScreen(
            // TODO: Add user data
            ));
      }
    } on FirebaseAuthException catch (e) {
      _authenticationController.stopLoadingSpinner();

      if (e.code == 'user-not-found') {
        Get.snackbar(
          error,
          userNotFound,
          backgroundColor: AppColors.dangerColor,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          error,
          wrongPassword,
          backgroundColor: AppColors.dangerColor,
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
        );
      } else if (e.code == 'invalid-login-credentials') {
        Get.snackbar(
          error,
          invalidCredentials,
          backgroundGradient: const LinearGradient(
            colors: [
              AppColors.blue,
              AppColors.dangerColor,
            ],
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: AppColors.white,
        );
      } else {
        Get.snackbar(
          error,
          loginWithEmailFailed,
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

  Future<bool> loginWithFacebookAccount() async {
    // TODO: implement loginWithFacebook
    return true;
  }

  Future<bool> loginWithGoogleAccount() async {
    // TODO: implement loginWithGoogle
    return true;
  }

  Future<bool> loginWithAppleAccount() async {
    // TODO: implement loginWithGoogle
    return true;
  }

  Future<bool> loginWithXAccount() async {
    // TODO: implement loginWithGoogle
    return true;
  }
}
