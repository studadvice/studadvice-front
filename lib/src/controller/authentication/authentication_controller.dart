import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class AuthenticationController extends GetxController {
  var isLoadingConnection = false.obs;

  static final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  // The user model used here is the firebase one.
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(firebaseAuthInstance.authStateChanges());
  }

  Future<bool> signUp(String email, String password) async {
    isLoadingConnection.value = true;

    await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    isLoadingConnection.value = false;

    return true;
  }

  Future<bool> signIn(String email, String password) async {
    isLoadingConnection.value = true;

    await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    isLoadingConnection.value = false;

    return true;
  }

  Future<bool> signOut() async {
    await firebaseAuthInstance.signOut();
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
