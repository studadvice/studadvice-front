import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class UserStorageController extends GetxController {
  Future<bool> saveUserData(UserData userData) async {
    var firebaseAuthInstance = AppDependenciesBinding.firebaseAuthInstance;
    var firebaseFirestoreInstance =
        AppDependenciesBinding.firebaseFirestoreInstance;

    // Get the current authenticated user
    User? user = firebaseAuthInstance.currentUser;

    if (user != null) {
      CollectionReference users = firebaseFirestoreInstance.collection('users');

      String uid = user.uid;

      Map<String, dynamic> userDataMap = userData.toJson();

      // Save the user data to Firestore
      await users.doc(uid).set(userDataMap);

      return true;
    } else {
      Get.snackbar(
        "user_storage_controller.userNotConnected".tr,
        "user_storage_controller.userNotConnectedMessage",
        colorText: AppColors.white,
        backgroundColor: AppColors.dangerColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "user_storage_controller.error".tr,
          style: const TextStyle(color: AppColors.white),
        ),
      );
      return false;
    }
  }
}
