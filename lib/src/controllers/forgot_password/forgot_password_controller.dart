import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ForgotPasswordController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final String successMessage =
      'Un email de réinitialisation du mot de passe a été envoyé à votre adresse email.';
  final String successTitle = 'Réinitialisation du mot de passe';
  final String errorTitle = 'Erreur';
  final String errorMessage =
      'Une erreur s\'est produite lors de la réinitialisation du mot de passe.';

  final TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  Future<void> resetPassword() async {
    LoadingSpinner.start();
    try {
      bool tryResetSuccess = await _authenticationController
          .resetPassword(emailController.text.trim());

      if (tryResetSuccess) {
        LoadingSpinner.stop();
        // Show a success message using Get.snackbar
        Get.snackbar(
          successTitle,
          successMessage,
          backgroundColor: AppColors.blue,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      LoadingSpinner.stop();
      // Show an error message using Get.snackbar
      Get.snackbar(
        errorTitle,
        errorMessage,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );
    }
  }
}
