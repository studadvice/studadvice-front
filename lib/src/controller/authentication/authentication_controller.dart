import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class AuthenticationController extends GetxController {
  var isLoadingConnection = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // The user model used here is the firebase one.
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<bool> signUp(String email, String password) async {
    isLoadingConnection.value = true;

    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    isLoadingConnection.value = false;

    return true;
  }

  void loadingSpinner() {
    Get.dialog(const Center(
      child: CircularProgressIndicator(
        color: AppColors.secondaryColor,
        strokeWidth: 5,
      ),
    ));
  }

  void stopLoadingSpinner() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
