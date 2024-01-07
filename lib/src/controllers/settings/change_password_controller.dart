import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ChangePasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> changePassword() async {
    try {
      String oldPassword = oldPasswordController.text;
      String newPassword = newPasswordController.text;
      String confirmPassword = confirmPasswordController.text;
      if (newPassword != confirmPassword) {
        Get.snackbar('Error', 'New password and confirm password do not match');
        return;
      }

      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        String oldPasswordHash = CryptoHash.hashValue(oldPassword);
        String newPasswordHash = CryptoHash.hashValue(newPassword);
        AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser.email!,
          password: oldPasswordHash,
        );

        await currentUser.reauthenticateWithCredential(credential);

        await currentUser.updatePassword(newPasswordHash);

        Get.snackbar('Success', 'Password changed successfully');
      } else {
        Get.snackbar('Error', 'User not signed in');
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to change password: $error');
    }
  }
}
