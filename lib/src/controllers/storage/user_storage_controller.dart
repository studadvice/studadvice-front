import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/conf/app_dependencies_binding.dart';
import 'package:stud_advice/src/models/user/user_data.dart';

class UserStorageController extends GetxController {
  final String error = "Erreur de connexion";
  final String registerWithEmailFailed =
      "Une erreur s'est produite lors de l'inscription";
  final String userNotConnected = "Vous n'êtes pas connecté";
  final String userNotConnectedMessage =
      "Vous devez être connecté pour vous inscrire";

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
        userNotConnected,
        userNotConnectedMessage,
        colorText: AppColors.white,
        backgroundColor: AppColors.dangerColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          error,
          style: const TextStyle(color: AppColors.white),
        ),
      );
      return false;
    }
  }
}
