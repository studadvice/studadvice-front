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

  Future<String> getPseudo(String userId) async {
    try {
      CollectionReference users = _firebaseFirestoreInstance.collection('users');

      DocumentSnapshot userSnapshot = await users.doc(userId).get();

      if (userSnapshot.exists) {
        String pseudo = userSnapshot.get('pseudo');
        return pseudo;
      } else {
        throw Exception("User pseudo not found");
      }
    } catch (error) {
      debugPrint("Error getting pseudo: $error");
      throw Exception("Error getting pseudo");
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
  
  Future<bool> addStepProgressionToUser(String userId, String administrativeProcessId, int stepIndex, int totalStepsNumber) async {
    try {
      CollectionReference users = _firebaseFirestoreInstance.collection('users');

      // The case where the user do not exist in the database.
      if (!await isUserPresent(userId)) {
        await users.doc(userId).set({
          'progress': [
            {
              'totalStepsNumber' : totalStepsNumber,
              'administrativeProcessId': administrativeProcessId,
              'stepIndex': stepIndex,
            },
          ],
        });
      } else {
        DocumentSnapshot userSnapshot = await users.doc(userId).get();
        Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;
        List<dynamic> progress = data['progress'] ?? [];

        bool found = false;
        for (var item in progress) {
          if (item['administrativeProcessId'] == administrativeProcessId) {
            item['stepIndex'] = stepIndex;
            found = true;
            break;
          }
        }

        if (!found) {
          progress.add({
            'totalStepsNumber' : totalStepsNumber,
            'administrativeProcessId': administrativeProcessId,
            'stepIndex': stepIndex,
          });
        }

        await users.doc(userId).update({
          'progress': progress,
        });
      }

      return true;
    } catch (error) {
      debugPrint("Error adding progression: $error");
      return false;
    }
  }
  
  Future<int?> getStepIndex(String userId, String administrativeProcessId) async {
    try {
      DocumentSnapshot userSnapshot = await _firebaseFirestoreInstance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;
        List<dynamic> progress = data['progress'] ?? [];
        for (var item in progress) {
          if (item['administrativeProcessId'] == administrativeProcessId) {
            return item['stepIndex'] as int?;
          }
        }
      }
      return null;
    } catch (e) {
      debugPrint("Error while getting step index: $e");
      return null;
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

  Future<bool> resetStepProgression(String userId, String administrativeProcessId, int totalStepsNumber) async {
    try {
      CollectionReference users = _firebaseFirestoreInstance.collection('users');

      // The case where the user do not exist in the database.
      if (!await isUserPresent(userId)) {
        await users.doc(userId).set({
          'progress': [
            {
              'totalStepsNumber' : totalStepsNumber,
              'administrativeProcessId': administrativeProcessId,
              'stepIndex': 0,
            },
          ],
        });
      } else {
        DocumentSnapshot userSnapshot = await users.doc(userId).get();
        Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;
        List<dynamic> progress = data['progress'] ?? [];

        bool found = false;
        for (var item in progress) {
          if (item['administrativeProcessId'] == administrativeProcessId) {
            item['stepIndex'] = 0;
            found = true;
            break;
          }
        }

        if (!found) {
          progress.add({
            'totalStepsNumber' : totalStepsNumber,
            'administrativeProcessId': administrativeProcessId,
            'stepIndex': 0,
          });
        }

        await users.doc(userId).update({
          'progress': progress,
        });
      }

      return true;
    } catch (error) {
      debugPrint("Error adding progression: $error");
      return false;
    }
  }
}
