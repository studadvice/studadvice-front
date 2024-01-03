import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../stud_advice.dart';
import '../../controllers/settings/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String navigatorId = '/change_password_screen';

  final ChangePasswordController changePasswordController =
  Get.find<ChangePasswordController>();

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
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: changePasswordController.oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'setting.change_password.old_password'.tr,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: changePasswordController.newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'setting.change_password.new_password'.tr,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: changePasswordController.confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'setting.change_password.new_password'.tr,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
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

