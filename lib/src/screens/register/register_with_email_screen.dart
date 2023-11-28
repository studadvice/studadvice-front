import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/chore/crypto_hash.dart';
import 'package:stud_advice/src/common/chore/form_validator.dart';
import 'package:stud_advice/src/controllers/legal_terms/legal_terms_controller.dart';
import 'package:stud_advice/src/controllers/register/register_with_email_controller.dart';
import 'package:stud_advice/src/widgets/common/buttons/custom_button.dart';
import 'package:stud_advice/src/widgets/common/textFields/classic_text_field.dart';
import 'package:stud_advice/src/widgets/common/textFields/password_text_field.dart';

class RegisterWithEmailScreen extends StatelessWidget {
  static const String navigatorId = '/register_with_email_screen';

  final RegisterWithEmailController _registerWithEmailController =
      Get.put(RegisterWithEmailController());
  final LegalTermsController _legalTermsController =
      Get.put(LegalTermsController());

  // Use constants to facilitate the implementation of the translation.
  final String emailHintText = 'Email';
  final String emailLabelText = 'Email';
  final String passwordHintText = 'Mot de passe';
  final String passwordLabelText = 'Mot de passe';
  final String confirmPasswordHintText = 'Confirmer le mot de passe';
  final String confirmPasswordLabelText = 'Confirmer le mot de passe';
  final String registerMessageText = 'Créer un compte';
  final String connectionButtonText = 'S\'inscrire';

  // Controllers for the text fields.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      GetBuilder<RegisterWithEmailController>(builder: (_) {
        return Scaffold(
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
                _legalTermsController.buildTermsAndConditionsButton(),
                _legalTermsController.buildTermsAndConditionsRow(),
                const SizedBox(height: 5),
                buildConnectionButton(),
              ],
            ),
          )),
        );
      });

  Widget buildRegisterText() {
    return Text(
      registerMessageText,
      style: const TextStyle(
        fontSize: AppFontSizes.extraLarge,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
      ),
    );
  }

  Widget buildEmailTextField() {
    return ClassicTextField(
      validator: (value) => FormValidator.validateEmail(value),
      hintText: emailHintText,
      labelText: emailLabelText,
      controller: emailController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      keyboardType: TextInputType.emailAddress,
      borderColor: AppColors.secondaryColor,
    );
  }

  Widget buildPasswordTextField() {
    return PasswordTextField(
        // Password should be at least 8 characters long and contain at least one uppercase letter, one number and one special character.
        validator: (value) => FormValidator.validatePassword(value),
        hintText: passwordHintText,
        labelText: passwordLabelText,
        controller: passwordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildConfirmPasswordTextField() {
    return PasswordTextField(
        validator: (value) => FormValidator.validateConfirmPassword(
            passwordController.text, value),
        hintText: confirmPasswordHintText,
        labelText: confirmPasswordLabelText,
        controller: confirmPasswordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildConnectionButton() {
    return CustomButton(
        text: connectionButtonText,
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () async {
          if (!_legalTermsController.agreeWithTermsAndConditions.value) {
            _legalTermsController.getSnackbarController();
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
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
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
