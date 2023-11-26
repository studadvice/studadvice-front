import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/chore/crypto_hash.dart';
import 'package:stud_advice/src/common/chore/form_validator.dart';
import 'package:stud_advice/src/controller/authentication/social_sign_in_controller.dart';
import 'package:stud_advice/src/controller/common/terms_and_conditions/terms_and_conditions_controller.dart';
import 'package:stud_advice/src/controller/login/login_controller.dart';
import 'package:stud_advice/src/screens/home/home_page.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/buttons/login_social_button.dart';
import 'package:stud_advice/src/widgets/dividers/divider_with_text.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';
import 'package:stud_advice/src/widgets/textFields/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const String navigatorId = '/login_screen';

  final LoginController _loginController = Get.put(LoginController());
  final SocialSignInController _socialSignInController =
      Get.put(SocialSignInController());
  final TermsAndConditionsController _termsAndConditionsController =
      Get.put(TermsAndConditionsController());

  // Use constants to facilitate the implementation of the translation.
  final String emailHintText = 'Email';
  final String emailLabelText = 'Email';
  final String passwordHintText = 'Mot de passe';
  final String passwordLabelText = 'Mot de passe';
  final String welcomeBackText = 'Bon retour parmi nous !';
  final String passwordText = 'Mot de passe';
  final String forgotPasswordText = 'Mot de passe oublié ?';
  final String rememberMeText = 'Se souvenir de moi';
  final String loginText = 'Se connecter';
  final String orContinueWithText = 'Ou continuer avec';
  final String passwordErrorText = 'Veuillez entrer votre mot de passe';
  final String acceptingTermsAndConditionsText =
      "En continuant la connexion ou l'inscription avec l'une des méthodes ci-dessus, vous acceptez nos conditions générales d'utilisation et notre politique de confidentialité.";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      GetBuilder<LoginController>(builder: (_) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  buildWelcomeBackText(),
                  const SizedBox(height: 40),
                  buildEmailTextField(),
                  const SizedBox(height: 15),
                  buildPasswordTextField(),
                  const SizedBox(height: 10),
                  buildRememberMeAndForgotPasswordRow(),
                  const SizedBox(height: 10),
                  buildLoginButton(),
                  const SizedBox(height: 10),
                  DividerWithText(text: orContinueWithText),
                  const SizedBox(height: 10),
                  buildSocialLoginButtons(context),
                  const SizedBox(height: 50),
                  buildTermsAndConditionsSection(),
                ],
              ),
            ),
          ),
        );
      });

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return passwordErrorText;
    }
    return null;
  }

  Widget buildEmailTextField() {
    return ClassicTextField(
        validator: FormValidator.validateEmail,
        hintText: emailHintText,
        labelText: emailLabelText,
        controller: _loginController.emailController,
        autofillHints: [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildPasswordTextField() {
    return PasswordTextField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return passwordErrorText;
          }
          return null;
        },
        hintText: passwordHintText,
        labelText: passwordLabelText,
        controller: _loginController.passwordController,
        autofillHints: [AutofillHints.password],
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildWelcomeBackText() {
    return Text(
      welcomeBackText,
      style: const TextStyle(
        fontSize: AppFontSizes.large25,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
      ),
    );
  }

  Widget buildRememberMeAndForgotPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _loginController.rememberMe.value,
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onChanged: (bool? value) {
            // TODO add the logic to save the user connection state.
            _loginController.rememberMe.value = value!;
          },
        ),
        Text(rememberMeText),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            // TODO add navigation to the forgot password screen
          },
          child: Text(
            forgotPasswordText,
            style: const TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return DefaultConnectionButton(
        text: loginText,
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          String email = _loginController.emailController.text;
          String password = _loginController.passwordController.text;
          String passwordHash = CryptoHash.hashValue(password);

          // TODO remember me logic.
          _loginController.loginWithEmailAndPassword(email, passwordHash);
        });
  }

  Widget buildSocialLoginButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginSocialButton(
          imagePath: 'assets/images/login/google.png',
          tileBackgroundColor: Colors.white,
          borderColor: AppColors.black26,
          onTap: () async {
            if (await _socialSignInController.loginWithGoogleAccount()) {
              Get.offAll(() => const HomePageScreen());
            }
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/facebook.png',
          tileBackgroundColor: AppColors.white,
          borderColor: AppColors.black26,
          iconColor: AppColors.blueAccent,
          onTap: () async {
            if (await _socialSignInController.loginWithFacebookAccount()) {
              Get.offAll(() => const HomePageScreen());
            }
          },
        ),
        if (Theme.of(context).platform == TargetPlatform.iOS)
          const SizedBox(width: 10),
        if (Theme.of(context).platform == TargetPlatform.iOS)
          LoginSocialButton(
            imagePath: 'assets/images/login/apple.png',
            tileBackgroundColor: AppColors.white,
            borderColor: AppColors.black26,
            onTap: () async {
              if (await _socialSignInController.loginWithAppleAccount()) {
                Get.offAll(() => const HomePageScreen());
              }
            },
          ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/x.png',
          tileBackgroundColor: Colors.white,
          borderColor: AppColors.black26,
          onTap: () async {
            if (await _socialSignInController.loginWithXAccount()) {
              Get.offAll(() => const HomePageScreen());
            }
          },
        ),
      ],
    );
  }

  Widget buildTermsAndConditionsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            acceptingTermsAndConditionsText,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        _termsAndConditionsController.buildTermsAndConditionsButton(),
      ],
    );
  }
}
