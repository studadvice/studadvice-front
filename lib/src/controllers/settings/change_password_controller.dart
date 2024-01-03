import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      print(oldPassword);
      print(newPassword);
      print(confirmPassword);
      if (newPassword != confirmPassword) {
        Get.snackbar('Error', 'New password and confirm password do not match');
        return;
      }

      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser.email!,
          password: oldPassword,
        );

        await currentUser.reauthenticateWithCredential(credential);

        await currentUser.updatePassword(newPassword);

        Get.snackbar('Success', 'Password changed successfully');
      } else {
        Get.snackbar('Error', 'User not signed in');
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to change password: $error');
    }
  }
}
