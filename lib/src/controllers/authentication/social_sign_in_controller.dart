import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class SocialSignInController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final I18n i18n = Get.find();

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

      if (signInSuccess) {
        LoadingSpinner.stop();
        return true;
      }
      return false;
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
        snackbarMessage = i18n.text('invalidLoginCredentials');
        break;
      default:
        snackbarMessage = i18n.text('signInWithSocialAccountFailed');
        textColor = AppColors.white;
        snackPosition = SnackPosition.BOTTOM;
    }

    Get.snackbar(i18n.text('error'), snackbarMessage,
        backgroundColor: backgroundColor,
        snackPosition: snackPosition,
        colorText: textColor);
  }
}
