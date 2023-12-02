import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/chore/crypto_hash.dart';
import 'package:stud_advice/src/common/chore/form_validator.dart';
import 'package:stud_advice/src/common/helper/navigation_helper.dart';
import 'package:stud_advice/src/controllers/authentication/social_sign_in_controller.dart';
import 'package:stud_advice/src/controllers/common/i18n_controller.dart';
import 'package:stud_advice/src/controllers/legal_terms/legal_terms_controller.dart';
import 'package:stud_advice/src/controllers/login/login_controller.dart';
import 'package:stud_advice/src/screens/forgot_password/forgot_password_screen.dart';
import 'package:stud_advice/src/screens/home/home_page_screen.dart';
import 'package:stud_advice/src/widgets/common/buttons/custom_button.dart';
import 'package:stud_advice/src/widgets/common/buttons/login_social_button.dart';
import 'package:stud_advice/src/widgets/common/dividers/divider_with_text.dart';
import 'package:stud_advice/src/widgets/common/textFields/classic_text_field.dart';
import 'package:stud_advice/src/widgets/common/textFields/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const String navigatorId = '/login_screen';

  final LoginController _loginController = Get.find<LoginController>();
  final SocialSignInController _socialSignInController =
      Get.find<SocialSignInController>();
  final LegalTermsController _termsAndConditionsController =
      Get.find<LegalTermsController>();
  final I18n i18n = Get.find();

  // Use constants to facilitate the implementation of the translation.

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
                  DividerWithText(text: i18n.text('orContinueWith')),
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
      return i18n.text('passwordError');
    }
    return null;
  }

  Widget buildEmailTextField() {
    return ClassicTextField(
        validator: FormValidator.validateEmail,
        hintText: i18n.text('emailHint'),
        labelText: i18n.text('emailLabel'),
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
            return i18n.text('passwordError');
          }
          return null;
        },
        hintText: i18n.text('passwordHint'),
        labelText: i18n.text('passwordLabel'),
        controller: _loginController.passwordController,
        autofillHints: [AutofillHints.password],
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildWelcomeBackText() {
    return Text(
      i18n.text('welcomeBack'),
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
        Text(i18n.text('rememberMe')),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            NavigationHelper.navigateTo(ForgotPasswordScreen.navigatorId);
          },
          child: Text(
            i18n.text('forgotPassword'),
            style: const TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return CustomButton(
        text: i18n.text('login'),
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
              Get.offAll(() => HomePageScreen());
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
              Get.offAll(() => HomePageScreen());
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
              debugPrint('Login with apple account');
              // if (await _socialSignInController.loginWithAppleAccount()) {
              //   Get.offAll(() => HomePageScreen());
              // }
            },
          ),
        // const SizedBox(width: 10),
        // LoginSocialButton(
        //   imagePath: 'assets/images/login/x.png',
        //   tileBackgroundColor: Colors.white,
        //   borderColor: AppColors.black26,
        //   onTap: () async {
        //     if (await _socialSignInController.loginWithXAccount()) {
        //       Get.offAll(() => HomePageScreen());
        //     }
        //   },
        // ),
      ],
    );
  }

  Widget buildTermsAndConditionsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            i18n.text('acceptingTermsAndConditions'),
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
