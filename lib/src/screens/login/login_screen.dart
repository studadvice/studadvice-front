import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class LoginScreen extends StatelessWidget {
  static const String navigatorId = '/login_screen';

  final LoginController _loginController = Get.find();
  final SocialSignInController _socialSignInController = Get.find();
  final LegalTermsController _termsAndConditionsController = Get.find();
  final I18n _i18n = Get.find();

  // initState function

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
                  DividerWithText(text: _i18n.text('orContinueWith')),
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
      return _i18n.text('passwordError');
    }
    return null;
  }

  Widget buildEmailTextField() {
    return ClassicTextField(
        validator: FormValidator.validateEmail,
        hintText: _i18n.text('emailHint'),
        labelText: _i18n.text('emailLabel'),
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
            return _i18n.text('passwordError');
          }
          return null;
        },
        hintText: _i18n.text('passwordHint'),
        labelText: _i18n.text('passwordLabel'),
        controller: _loginController.passwordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildWelcomeBackText() {
    return Text(
      _i18n.text('welcomeBack'),
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
        Obx(() => Checkbox(
              value: _loginController.rememberMe.value,
              activeColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (bool? value) {
                _loginController.rememberMe.value = value!;
              },
            )),
        Text(_i18n.text('rememberMe')),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Get.to(() => ForgotPasswordScreen());
          },
          child: Text(
            _i18n.text('forgotPassword'),
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
        text: _i18n.text('login'),
        textColor: AppColors.white,
        backgroundColor: AppColors.blue,
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          String email = _loginController.emailController.text;
          String password = _loginController.passwordController.text;
          String passwordHash = CryptoHash.hashValue(password);

          _loginController.loginWithEmailAndPassword(email, passwordHash);
        });
  }

  Widget buildSocialLoginButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          imagePath: 'assets/images/login/google.png',
          tileBackgroundColor: Colors.white,
          borderColor: AppColors.black26,
          onTap: () async {
            if (await _socialSignInController.loginWithGoogleAccount()) {
              Get.offAllNamed(HomePageScreen.navigatorId);
            }
          },
          borderRadius: 16,
          imageSize: 25,
          padding: 20,
        ),
        const SizedBox(width: 10),
        SocialButton(
          imagePath: 'assets/images/login/facebook.png',
          tileBackgroundColor: AppColors.white,
          borderColor: AppColors.black26,
          iconColor: AppColors.blueAccent,
          onTap: () async {
            if (await _socialSignInController.loginWithFacebookAccount()) {
              Get.offAllNamed(HomePageScreen.navigatorId);
            }
          },
          borderRadius: 16,
          imageSize: 25,
          padding: 20,
        ),
        if (Theme.of(context).platform == TargetPlatform.iOS)
          const SizedBox(width: 10),
        if (Theme.of(context).platform == TargetPlatform.iOS)
          SocialButton(
            imagePath: 'assets/images/login/apple.png',
            tileBackgroundColor: AppColors.white,
            borderColor: AppColors.black26,
            onTap: () async {
              if (await _socialSignInController.loginWithAppleAccount()) {
                Get.offAllNamed(HomePageScreen.navigatorId);
              }
            },
            borderRadius: 16,
            imageSize: 25,
            padding: 20,
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
            _i18n.text('acceptingTermsAndConditions'),
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
