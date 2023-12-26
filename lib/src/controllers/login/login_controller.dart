import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../screens/dashboard/dashboard_screen.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

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
        Get.offAllNamed(DashboardScreen.navigatorId);
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
        snackbarMessage = "login_controller.userNotFound".tr;
        break;
      case 'wrong-password':
        snackbarMessage = "login_controller.wrongPassword".tr;
        break;
      case 'invalid-login-credentials':
      case 'invalid-credential':
        snackbarMessage = "login_controller.invalidCredentials".tr;
        break;
      default:
        snackbarMessage = "login_controller.loginWithEmailFailed".tr;
        textColor = AppColors.white;
        snackPosition = SnackPosition.BOTTOM;
    }

    Get.snackbar("login_controller.error".tr, snackbarMessage,
        backgroundColor: backgroundColor,
        snackPosition: snackPosition,
        colorText: textColor);
  }
}
