import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RegisterWithEmailScreen extends StatelessWidget {
  static const String navigatorId = '/register_with_email_screen';

  final RegisterWithEmailController _registerWithEmailController = Get.find();
  final LegalTermsController _legalTermsController = Get.find();

  // Controllers for the text fields.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const SizedBox(height: 10),
              buildRegisterText(),
              const SizedBox(height: 50),
              buildEmailTextField(),
              const SizedBox(height: 15),
              buildPasswordTextField(),
              const SizedBox(height: 15),
              buildConfirmPasswordTextField(),
              const SizedBox(height: 100),
              _legalTermsController.buildTermsAndConditionsButton(
                  'register.legalConditionsButton'.tr),
              _legalTermsController.buildTermsAndConditionsRow(
                  'register.acceptingTermsAndConditions'.tr),
              const SizedBox(height: 5),
              buildConnectionButton(context),
            ],
          ),
        )),
      );

  Widget buildRegisterText() {
    return Text(
      'register.registerMessage'.tr,
      style: const TextStyle(
        fontSize: AppFontSizes.extraLarge,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget buildEmailTextField() {
    return ClassicTextField(
      validator: (value) => FormValidator.validateEmail(value),
      hintText: 'register.emailHint'.tr,
      labelText: 'register.emailLabel'.tr,
      controller: _emailController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.primaryColor,
      keyboardType: TextInputType.emailAddress,
      borderColor: AppColors.primaryColor,
    );
  }

  Widget buildPasswordTextField() {
    return PasswordTextField(
        // Password should be at least 8 characters long and contain at least one uppercase letter, one number and one special character.
        validator: (value) => FormValidator.validatePassword(value),
        hintText: 'register.passwordHint'.tr,
        labelText: 'register.passwordLabel'.tr,
        controller: _passwordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.primaryColor,
        borderColor: AppColors.primaryColor);
  }

  Widget buildConfirmPasswordTextField() {
    return PasswordTextField(
        validator: (value) => FormValidator.validateConfirmPassword(
            _passwordController.text, value),
        hintText: 'register.confirmPasswordHint'.tr,
        labelText: 'register.confirmPasswordLabel'.tr,
        controller: _confirmPasswordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.primaryColor,
        borderColor: AppColors.primaryColor);
  }

  Widget buildConnectionButton(BuildContext context) {
    return CustomButton(
        text: 'register.connectionButton'.tr,
        textColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if (!_legalTermsController.agreeWithTermsAndConditions.value) {
            _legalTermsController.getSnackbarController(
                'register.acceptTermsAndConditionsError'.tr,
                'register.termsAndConditions'.tr);
            return;
          }

          if (!_formKey.currentState!.validate()) {
            return;
          }

          dynamic formData = collectFormData();

          _registerWithEmailController.handleRegisterWithEmail(formData);
        });
  }

  dynamic collectFormData() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String hashedPassword = CryptoHash.hashValue(password);
    bool hasAcceptedTermsAndConditions =
        _legalTermsController.agreeWithTermsAndConditions.value;
    return {
      'email': email,
      'hashedPassword': hashedPassword,
      'hasAcceptedTermsAndConditions': hasAcceptedTermsAndConditions,
    };
  }
}
