import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  // Controllers for the text fields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

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
      handleLoginWithEmailAndPasswordError(e.code);
    }
  }

  void handleLoginWithEmailAndPasswordError(String errorCode) {
    Color backgroundColor = AppColors.dangerColor;
    Color textColor = AppColors.white;
    SnackPosition snackPosition = SnackPosition.BOTTOM;
    String snackbarMessage;

    switch (errorCode) {
      case 'user-not-found':
        snackbarMessage = userNotFound;
        break;
      case 'wrong-password':
        snackbarMessage = wrongPassword;
        break;
      case 'invalid-login-credentials':
        snackbarMessage = invalidCredentials;
        break;
      default:
        snackbarMessage = loginWithEmailFailed;
        textColor = AppColors.white;
        snackPosition = SnackPosition.BOTTOM;
    }

    Get.snackbar(error, snackbarMessage,
        backgroundColor: backgroundColor,
        snackPosition: snackPosition,
        colorText: textColor);
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
