import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';
import 'package:stud_advice/src/widgets/loading/loading_spinner.dart';

class SocialSignInController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final String error = "Erreur de connexion";
  final String invalidCredentials = "Email ou mot de passe incorrects";
  final String signInWithSocialAccountFailed =
      "Une erreur s'est produite lors de la connexion";

  Future<bool> loginWithGoogleAccount() async {
    try {
      LoadingSpinner.start();

      bool signInSuccess = await _authenticationController.signInWithGoogle();

      return signInSuccess;
    } on FirebaseAuthException catch (e) {
      handleLoginError(e.code);
      return false;
    } finally {
      LoadingSpinner.stop();
    }
  }

  Future<bool> loginWithFacebookAccount() async {
    try {
      LoadingSpinner.start();

      bool signInSuccess = await _authenticationController.signInWithFacebook();

      return signInSuccess;
    } on FirebaseAuthException catch (e) {
      handleLoginError(e.code);
      return false;
    } finally {
      LoadingSpinner.stop();
    }
  }

  Future<bool> loginWithAppleAccount() async {
    // TODO: implement loginWithAppleAccount
    return true;
  }

  // Future<bool> loginWithXAccount() async {
  //   // TODO: implement loginWithX
  //   return true;
  // }

  void handleLoginError(String errorCode) {
    Color backgroundColor = AppColors.dangerColor;
    Color textColor = AppColors.white;
    SnackPosition snackPosition = SnackPosition.BOTTOM;
    String snackbarMessage;

    switch (errorCode) {
      case 'invalid-login-credentials':
      case 'invalid-credential':
        snackbarMessage = invalidCredentials;
        break;
      default:
        snackbarMessage = signInWithSocialAccountFailed;
        textColor = AppColors.white;
        snackPosition = SnackPosition.BOTTOM;
    }

    Get.snackbar(error, snackbarMessage,
        backgroundColor: backgroundColor,
        snackPosition: snackPosition,
        colorText: textColor);
  }
}
