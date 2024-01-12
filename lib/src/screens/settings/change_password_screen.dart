import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String navigatorId = '/change_password_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'setting.change_password.title'.tr,
          style: const TextStyle(
            fontSize: AppFontSizes.large18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ChangePasswordForm(),
    );
  }
}

class ChangePasswordForm extends StatelessWidget {
  final ChangePasswordController changePasswordController =
      Get.find<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PasswordTextField(
              // Password should be at least 8 characters long and contain at least one uppercase letter, one number and one special character.
              validator: (value) => FormValidator.validatePassword(value),
              hintText: 'register.passwordHint'.tr,
              labelText: 'setting.change_password.old_password'.tr,
              controller: changePasswordController.oldPasswordController,
              backgroundColor: AppColors.white,
              focusedBorderColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor),
          const SizedBox(height: 16.0),
          PasswordTextField(
              // Password should be at least 8 characters long and contain at least one uppercase letter, one number and one special character.
              validator: (value) => FormValidator.validatePassword(value),
              hintText: 'register.passwordHint'.tr,
              labelText: 'setting.change_password.new_password'.tr,
              controller: changePasswordController.newPasswordController,
              backgroundColor: AppColors.white,
              focusedBorderColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor),
          const SizedBox(height: 16.0),
          PasswordTextField(
              // Password should be at least 8 characters long and contain at least one uppercase letter, one number and one special character.
              validator: (value) => FormValidator.validatePassword(value),
              hintText: 'register.passwordHint'.tr,
              labelText: 'setting.change_password.confirm_password'.tr,
              controller: changePasswordController.confirmPasswordController,
              backgroundColor: AppColors.white,
              focusedBorderColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor),
          const SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                changePasswordController.changePassword();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                'setting.change_password.change_password'.tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
