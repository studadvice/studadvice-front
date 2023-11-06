import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_colors.dart';

import '../../../../../common/chore/app_fonts_sizes.dart';
import '../../../common/widgets/classic_text_field.dart';
import '../../../common/widgets/default_connection_button.dart';
import '../../../common/widgets/divider_with_text.dart';
import '../../../common/widgets/password_text_field.dart';
import '../widgets/login_social_button.dart';

class LoginScreen extends StatefulWidget {
  static const String navigatorId = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Use constants to facilitate the implementation of the translation.
  final String emailOrPseudoHintText = 'Email ou pseudo';
  final String passwordHintText = 'Mot de passe';
  final String welcomeBackText = 'Bon retour parmi nous !';
  final String passwordText = 'Mot de passe';
  final String forgotPasswordText = 'Mot de passe oublié ?';
  final String rememberMeText = 'Se souvenir de moi';
  final String loginText = 'Se connecter';
  final String orContinueWithText = 'Ou continuer avec';

  // State variables.
  bool _rememberMe = true;

  // Controllers for the text fields.
  final TextEditingController emailOrPseudoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    emailOrPseudoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
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
                buildSocialLoginButtons(),
              ],
            ))
          ],
        ),
      );

  Widget buildEmailTextField() {
    return ClassicTextField(
        // TODO add validator for the input fields
        hintText: emailOrPseudoHintText,
        controller: emailOrPseudoController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildPasswordTextField() {
    return PasswordTextField(
        hintText: passwordHintText,
        controller: passwordController,
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
          // TODO add the logic to connect the user
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
            // TODO add the logic to connect the user with google
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/facebook.png',
          tileBackgroundColor: AppColors.white,
          borderColor: AppColors.black26,
          iconColor: AppColors.blueAccent,
          onTap: () {
            // TODO add the logic to connect the user with facebook
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/apple.png',
          tileBackgroundColor: AppColors.white,
          borderColor: AppColors.black26,
          onTap: () {
            // TODO add the logic to connect the user with apple
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/x.png',
          tileBackgroundColor: Colors.white,
          borderColor: AppColors.black26,
          onTap: () {
            // TODO add the logic to connect the user with twitter
          },
        ),
      ],
    );
  }
}
