import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_colors.dart';
import 'package:stud_advice/features/user/components/connection/connection_password_text_field.dart';

import '../../components/connection/connection__classic_text_field.dart';

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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              welcomeBackText,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(height: 25),
            ConnectionClassicTextField(
                // TODO add validator for the input fields
                hintText: emailOrPseudoHintText,
                controller: emailOrPseudoController,
                backgroundColor: AppColors.backgroundColor,
                focusedBorderColor: AppColors.secondaryColor,
                borderColor: AppColors.secondaryColor),
            const SizedBox(height: 25),
            ConnectionPasswordTextField(
                hintText: passwordHintText,
                controller: passwordController,
                backgroundColor: AppColors.backgroundColor,
                focusedBorderColor: AppColors.secondaryColor,
                borderColor: AppColors.secondaryColor),
            const SizedBox(height: 15),
            buildRememberMeAndForgotPasswordRow(),
          ],
        )

            // Messsage d'accueil pour la connexion,
            // avec un bouton pour aller à la page d'inscription
            // input pour le mail ou le pseudo
            // input pour le mot de passe avec un bouton pour le montrer ou le cacher
            //  mot de passe oublié
            // case à cocher pour se souvenir de mon mot de passe
            // bouton pour se connecter
            // ou avec des divider
            // bouton pour se connecter avec google (une tile)
            // bouton pour se connecter avec apple (une tile)
            // bouton pour se connecter avec twitter (une tile)
            ),
      );
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
}
