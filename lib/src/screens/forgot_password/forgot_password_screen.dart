import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String navigatorId = '/forgot_password_screen';

  final ForgotPasswordController _forgotPasswordController = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(child: Text('forgot_password.title'.tr)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Image(
                  image: AssetImage(
                      'assets/images/forgot_password/forgot_password_logo.png'),
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'forgot_password.forgotPasswordMessage'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: AppFontSizes.large18,
                      color: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ClassicTextField(
                  controller: _forgotPasswordController.emailController,
                  hintText: 'forgot_password.emailHint'.tr,
                  labelText: 'forgot_password.emailLabel'.tr,
                  validator: (value) => FormValidator.validateEmail(value),
                  autofillHints: [AutofillHints.email],
                  backgroundColor: AppColors.white,
                  focusedBorderColor: AppColors.blue,
                  borderColor: AppColors.blue,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      text: 'forgot_password.send'.tr,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _forgotPasswordController.resetPassword(
                              'forgot_password.successTitle'.tr,
                              'forgot_password.successMessage'.tr,
                              'forgot_password.errorTitle'.tr,
                              'forgot_password.errorMessage'.tr);
                        }
                      },
                      textColor: AppColors.white,
                      backgroundColor: AppColors.blue),
                ),
              ],
            ),
          ),
        ),
      );
}
