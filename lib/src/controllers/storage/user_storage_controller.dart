import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class UserStorageController extends GetxController {
  var _firebaseAuthInstance = AppDependenciesBinding.firebaseAuthInstance;
  var _firebaseFirestoreInstance =
      AppDependenciesBinding.firebaseFirestoreInstance;

  String getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception("User not connected");
    }
  }

  User getCurrentUser() {
    User? user = _firebaseAuthInstance.currentUser;
    if (user != null) {
      return user;
    } else {
      throw Exception("User not connected");
    }
  }

  Future<bool> saveUserData(UserData userData) async {
    var firebaseFirestoreInstance =
        AppDependenciesBinding.firebaseFirestoreInstance;

    // Get the current authenticated user
    User? user = _firebaseAuthInstance.currentUser;

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
        "user_storage_controller.userNotConnectedMessage".tr,
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

  Future<List<String>> getFavorites(String userId) async {
    try {
      CollectionReference users =
          _firebaseFirestoreInstance.collection('users');

      DocumentSnapshot userSnapshot = await users.doc(userId).get();

      if (userSnapshot.exists) {
        List<dynamic>? favorites = userSnapshot.get('favoriteProcesses');

        return favorites?.cast<String>() ?? [];
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<bool> isUserPresent(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await _firebaseFirestoreInstance
          .collection('users')
          .doc(userId)
          .get();

      return userSnapshot.exists;
    } catch (e) {
      debugPrint("Error while checking if user is present: $e");
      return false;
    }
  }

  Future<bool> addAdministrativeProcessToFavorites(
      String userId, String administrativeProcessId) async {
    try {
      CollectionReference users =
          _firebaseFirestoreInstance.collection('users');

      // The case where the user do not exist in the database.
      if (!await isUserPresent(userId)) {
        await users.doc(userId).set({
          'favoriteProcesses': FieldValue.arrayUnion([administrativeProcessId]),
        });
      }

      await users.doc(userId).update({
        'favoriteProcesses': FieldValue.arrayUnion([administrativeProcessId]),
      });

      return true;
    } catch (error) {
      debugPrint("Error adding to favorites: $error");
      return false;
    }
  }

  Future<bool> removeAdministrativeProcessFromFavorites(
      String userId, String administrativeProcessId) async {
    try {
      CollectionReference users =
          _firebaseFirestoreInstance.collection('users');

      DocumentReference userDocument = users.doc(userId);

      await userDocument.update({
        'favoriteProcesses': FieldValue.arrayRemove([administrativeProcessId]),
      });

      return true;
    } catch (error) {
      return false;
    }
  }
}
