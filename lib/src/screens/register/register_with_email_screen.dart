import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/chore/crypto_hash.dart';
import 'package:stud_advice/src/common/chore/form_validator.dart';
import 'package:stud_advice/src/controller/authentication/authentication_controller.dart';
import 'package:stud_advice/src/controller/register/register_with_email_controller.dart';
import 'package:stud_advice/src/screens/legal_conditions/legal_conditions_screen.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';
import 'package:stud_advice/src/widgets/textFields/password_text_field.dart';

class RegisterWithEmailScreen extends StatelessWidget {
  static const String navigatorId = '/register_with_email_screen';

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final RegisterWithEmailController _registerWithEmailController =
      Get.put(RegisterWithEmailController());

  // Use constants to facilitate the implementation of the translation.
  final String emailHintText = 'Email';
  final String emailLabelText = 'Email';
  final String passwordHintText = 'Mot de passe';
  final String passwordLabelText = 'Mot de passe';
  final String confirmPasswordHintText = 'Confirmer le mot de passe';
  final String confirmPasswordLabelText = 'Confirmer le mot de passe';
  final String registerMessageText = 'Créer un compte';
  final String connectionButtonText = 'S\'inscrire';
  final String legalConditionsButtonText = 'Voir les Termes et Conditions';
  final String acceptTermsAndConditionsText =
      'J\'accepte les conditions générales d\'utilisation';
  final String acceptTermsAndConditionsErrorText =
      'Veuillez accepter les termes et conditions';
  final String termsAndConditionsText = 'Termes et Conditions';

  // Controllers for the text fields.
  final TextEditingController emailOrPseudoController = TextEditingController();
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
                buildTermsAndConditionsButton(),
                buildTermsAndConditionsRow(),
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
      controller: emailOrPseudoController,
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
    return DefaultConnectionButton(
        text: connectionButtonText,
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () async {
          if (!_registerWithEmailController.agreeWithTermsAndConditions.value) {
            getSnackbarController();
            return;
          }

          if (!_formKey.currentState!.validate()) {
            return;
          }

          dynamic formData = collectFormData();

          _registerWithEmailController.handleRegisterWithEmail(
              _authenticationController, formData);
        });
  }

  SnackbarController getSnackbarController() {
    return Get.snackbar(
      termsAndConditionsText,
      acceptTermsAndConditionsErrorText,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      titleText: Text(
        termsAndConditionsText,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        acceptTermsAndConditionsErrorText,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
        ),
      ),
      backgroundColor: AppColors.dangerColor,
    );
  }

  dynamic collectFormData() {
    String email = emailOrPseudoController.text.trim();
    String password = passwordController.text.trim();
    String hashedPassword = CryptoHash.hashValue(password);
    bool hasAcceptedTermsAndConditions =
        _registerWithEmailController.agreeWithTermsAndConditions.value;
    return {
      'email': email,
      'hashedPassword': hashedPassword,
      'hasAcceptedTermsAndConditions': hasAcceptedTermsAndConditions,
    };
  }

  Widget buildTermsAndConditionsButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => LegalTermsScreen());
      },
      child: Text(
        legalConditionsButtonText,
        style: const TextStyle(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.medium,
        ),
      ),
    );
  }

  Widget buildTermsAndConditionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Checkbox(
              value: _registerWithEmailController
                  .agreeWithTermsAndConditions.value,
              activeColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (bool? value) {
                _registerWithEmailController.agreeWithTermsAndConditions.value =
                    value!;
              },
            )),
        Text(
          acceptTermsAndConditionsText,
          style: const TextStyle(
            fontSize: AppFontSizes.medium,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
