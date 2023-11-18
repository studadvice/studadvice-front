import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/services/login/login_service.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/buttons/login_social_button.dart';
import 'package:stud_advice/src/widgets/dividers/divider_with_text.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';
import 'package:stud_advice/src/widgets/textFields/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String navigatorId = '/login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Use constants to facilitate the implementation of the translation.
  final String emailOrPseudoHintText = 'Email ou pseudo';
  final String emailOrPseudoLabelText = 'Email ou pseudo';
  final String passwordHintText = 'Mot de passe';
  final String passwordLabelText = 'Mot de passe';
  final String welcomeBackText = 'Bon retour parmi nous !';
  final String passwordText = 'Mot de passe';
  final String forgotPasswordText = 'Mot de passe oublié ?';
  final String rememberMeText = 'Se souvenir de moi';
  final String loginText = 'Se connecter';
  final String orContinueWithText = 'Ou continuer avec';
  final String emailOrPseudoErrorText = 'Veuillez entrer votre email ou pseudo';
  final String passwordErrorText = 'Veuillez entrer votre mot de passe';

  // State variables.
  bool _rememberMe = true;

  // Service.
  final loginService = Get.find<LoginService>();

  // Controllers for the text fields.
  final TextEditingController _emailOrPseudoController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    _emailOrPseudoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                buildWelcomeBackText(),
                const SizedBox(height: 40),
                buildEmailOrPseudoTextField(),
                const SizedBox(height: 15),
                buildPasswordTextField(),
                const SizedBox(height: 10),
                buildRememberMeAndForgotPasswordRow(),
                const SizedBox(height: 10),
                buildLoginButton(),
                const SizedBox(height: 10),
                DividerWithText(text: orContinueWithText),
                const SizedBox(height: 10),
                buildSocialLoginButtons(),
              ],
            ),
          ),
        ),
      );

  String? validateEmailOrPseudo(String? value) {
    if (value == null || value.isEmpty) {
      return emailOrPseudoErrorText;
    }

    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (emailRegExp.hasMatch(value)) {
      return null;
    }

    final pseudoRegExp = RegExp(r'^[a-zA-Z0-9_]+$');
    if (pseudoRegExp.hasMatch(value)) {
      return null;
    }

    return emailOrPseudoErrorText;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return passwordErrorText;
    }
    return null;
  }

  Widget buildEmailOrPseudoTextField() {
    return ClassicTextField(
        validator: (value) => validateEmailOrPseudo(value),
        hintText: emailOrPseudoHintText,
        labelText: emailOrPseudoLabelText,
        controller: _emailOrPseudoController,
        autofillHints: [AutofillHints.email, AutofillHints.username],
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
        controller: _passwordController,
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
          value: _rememberMe,
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onChanged: (bool? value) {
            // TODO add the logic to save the user connection state.
            setState(() {
              _rememberMe = value!;
            });
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
          if (_formKey.currentState!.validate()) {
            String emailOrPseudo = _emailOrPseudoController.text;
            String password = _passwordController.text;

            if (emailOrPseudo.contains('@')) {
              loginService.loginWithEmailAndPassword(emailOrPseudo, password);
            } else {
              loginService.loginWithPseudoAndPassword(emailOrPseudo, password);
            }
          }
        });
  }

  Widget buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginSocialButton(
          imagePath: 'assets/images/login/google.png',
          tileBackgroundColor: Colors.white,
          borderColor: AppColors.black26,
          onTap: () {
            loginService.loginWithGoogleAccount();
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/facebook.png',
          tileBackgroundColor: AppColors.white,
          borderColor: AppColors.black26,
          iconColor: AppColors.blueAccent,
          onTap: () {
            loginService.loginWithFacebookAccount();
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/apple.png',
          tileBackgroundColor: AppColors.white,
          borderColor: AppColors.black26,
          onTap: () {
            loginService.loginWithAppleAccount();
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/x.png',
          tileBackgroundColor: Colors.white,
          borderColor: AppColors.black26,
          onTap: () {
            loginService.loginWithXAccount();
          },
        ),
      ],
    );
  }
}
