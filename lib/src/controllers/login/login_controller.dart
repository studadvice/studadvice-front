import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/helper/navigation_helper.dart';
import 'package:stud_advice/src/controllers/authentication/authentication_controller.dart';
import 'package:stud_advice/src/screens/home/home_page_screen.dart';
import 'package:stud_advice/src/widgets/common/loading/loading_spinner.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.find();

  // Controllers for the text fields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var rememberMe = true.obs;

  @override
  void onInit() async {
    _loadRememberMeCredentials();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  final String error = "Erreur de connexion";
  final String loginWithEmailFailed =
      "Une erreur s'est produite lors de la connexion";
  final String invalidCredentials = "Email ou mot de passe incorrects";
  final String wrongPassword = "Mot de passe incorrect";
  final String userDisabled = "Le compte a été désactivé";
  final String userNotFound = "Le compte n'existe pas";

  Future<void> loginWithEmailAndPassword(
      String email, String hashedPassword) async {
    LoadingSpinner.start();

    try {
      bool signInSuccess =
          await _authenticationController.signInWithEmailAndPassword(
        email,
        hashedPassword,
      );

      if (signInSuccess) {
        LoadingSpinner.stop();
        // After the user is connected, we redirect him to the home page.
        // Here we use the Get.offAll() method to remove all the previous screens
        // from the stack.
        // So the user can't go back to the login screen.
        Get.offAll(HomePageScreen());
      }
    } on FirebaseAuthException catch (e) {
      LoadingSpinner.stop();
      handleLoginError(e.code);
    }
  }

  void saveRememberMeCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('rememberMeEmail', email);
    prefs.setString('rememberMePassword', password);
  }

  void _loadRememberMeCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('rememberMeEmail');
    String? password = prefs.getString('rememberMePassword');

    if (email != null && password != null) {
      emailController.text = email;
      passwordController.text = password;
      rememberMe.value = true;
    }
  }

  void handleLoginError(String errorCode) {
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
      case 'invalid-credential':
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
}
