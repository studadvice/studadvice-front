import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class AuthenticationController extends GetxController {
  var isLoadingConnection = false.obs;
  var signUpWithEmailAndPasswordSuccessful = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String error = "Erreur";
  final String registerWithEmailFailed =
      "Une erreur s'est produite lors de l'inscription";
  final String alreadyHaveAnAccount =
      "Un compte existe déjà avec cette adresse email";

  // The user model used here is the firebase one.
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint("User created: ${userCredential.user!.email}");

      signUpWithEmailAndPasswordSuccessful.value = true;
    } on FirebaseAuthException catch (e) {
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

  void loadingSpinner() {
    if (isLoadingConnection.value) {
      Get.dialog(const Center(
        child: CircularProgressIndicator(
          color: AppColors.secondaryColor,
          strokeWidth: 5,
        ),
      ));
    }
  }
}
