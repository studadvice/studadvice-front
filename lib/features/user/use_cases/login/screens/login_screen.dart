import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_colors.dart';

import '../../../common/widgets/connection__classic_text_field.dart';
import '../../../common/widgets/connection_password_text_field.dart';
import '../../../common/widgets/divider_with_text.dart';
import '../widgets/login_connection_button.dart';
import '../widgets/login_social_button.dart';

class LoginScreen extends StatefulWidget {
  static const String navigatorId = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            buildWelcomeBackText(),
            const SizedBox(height: 20),
            ConnectionClassicTextField(
                // TODO add validator for the input fields
                hintText: emailOrPseudoHintText,
                controller: emailOrPseudoController,
                backgroundColor: AppColors.backgroundColor,
                focusedBorderColor: AppColors.secondaryColor,
                borderColor: AppColors.secondaryColor),
            const SizedBox(height: 15),
            ConnectionPasswordTextField(
                hintText: passwordHintText,
                controller: passwordController,
                backgroundColor: AppColors.backgroundColor,
                focusedBorderColor: AppColors.secondaryColor,
                borderColor: AppColors.secondaryColor),
            const SizedBox(height: 10),
            buildRememberMeAndForgotPasswordRow(),
            const SizedBox(height: 10),
            buildLoginButton(),
            const SizedBox(height: 10),
            DividerWithText(text: orContinueWithText),
            const SizedBox(height: 10),
            buildSocialLoginButtons(),
          ],
        )),
      );

  Widget buildWelcomeBackText() {
    return Text(
      welcomeBackText,
      style: const TextStyle(
        fontSize: 25,
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
          // fillColor: MaterialStateProperty.all(Colors.white),
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onChanged: (bool? value) {
            // Action à effectuer lors de la modification de l'état de la case à cocher.
            setState(() {
              _rememberMe = value!;
              // TODO add the logic to save the state of the checkbox
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
              color: AppColors
                  .primaryColorAccent, // Changer la couleur selon votre conception.
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return LoginConnectionButton(
        text: loginText,
        textColor: Colors.black,
        backgroundColor: AppColors.backgroundColor,
        borderColor: AppColors.primaryColorAccent,
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
          borderColor: Colors.black26,
          onTap: () {
            // TODO add the logic to connect the user with google
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/facebook.png',
          tileBackgroundColor: Colors.white,
          borderColor: Colors.black26,
          iconColor: Colors.blueAccent,
          onTap: () {
            // TODO add the logic to connect the user with facebook
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/apple.png',
          tileBackgroundColor: Colors.white,
          borderColor: Colors.black26,
          onTap: () {
            // TODO add the logic to connect the user with apple
          },
        ),
        const SizedBox(width: 10),
        LoginSocialButton(
          imagePath: 'assets/images/login/x.png',
          tileBackgroundColor: Colors.white,
          borderColor: Colors.black26,
          onTap: () {
            // TODO add the logic to connect the user with twitter
          },
        ),
      ],
    );
  }
}
