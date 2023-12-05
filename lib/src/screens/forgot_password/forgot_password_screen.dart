import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String navigatorId = '/forgot_password_screen';

  final ForgotPasswordController _forgotPasswordController = Get.find();

  final I18n _i18n = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(child: Text(_i18n.text('forgotPasswordTitle'))),
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
                    _i18n.text('forgotPasswordMessage'),
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
                  hintText: _i18n.text('emailHint'),
                  labelText: _i18n.text('emailLabel'),
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
                      text: _i18n.text('send'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _forgotPasswordController.resetPassword(
                              _i18n.text('successTitle'),
                              _i18n.text('successMessage'),
                              _i18n.text('errorTitle'),
                              _i18n.text('errorMessage'));
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
