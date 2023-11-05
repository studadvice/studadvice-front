import 'package:flutter/material.dart';
import 'package:stud_advice/common/chore/app_fonts_sizes.dart';

import '../../../../../common/chore/app_colors.dart';
import '../../../common/widgets/connection__classic_text_field.dart';
import '../../../common/widgets/connection_password_text_field.dart';
import '../../../common/widgets/default_connection_button.dart';
import '../../legal_conditions/screens/legal_conditions_screen.dart';

class RegisterWithEmailScreen extends StatefulWidget {
  static const String navigatorId = 'register_with_email_screen';

  const RegisterWithEmailScreen({Key? key}) : super(key: key);

  @override
  State<RegisterWithEmailScreen> createState() =>
      _RegisterWithEmailScreenState();
}

class _RegisterWithEmailScreenState extends State<RegisterWithEmailScreen> {
  // State variables.
  bool _agreeWithTermsAndConditions = false;

  // Use constants to facilitate the implementation of the translation.
  final String emailOrPseudoHintText = 'Email';
  final String passwordHintText = 'Mot de passe';
  final String confirmPasswordHintText = 'Confirmer le mot de passe';
  final String registerMessageText = 'Créer un compte';
  final String connectionButtonText = 'S\'inscrire';
  final String legalConditionsButtonText = 'Voir les Termes et Conditions';
  final String acceptTermsAndConditionsText =
      'J\'accepte les conditions générales d\'utilisation';

  // Controllers for the text fields.
  final TextEditingController emailOrPseudoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed.
    emailOrPseudoController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
          buildRegisterText(),
          const SizedBox(height: 20),
          buildEmailTextField(),
          const SizedBox(height: 15),
          buildPasswordTextField(),
          const SizedBox(height: 15),
          buildConfirmPasswordTextField(),
          const SizedBox(height: 100),
          buildTermsAndConditionsRow(),
          const SizedBox(height: 5),
          buildConnectionButton(),
        ],
      )));

  Widget buildEmailTextField() {
    return ConnectionClassicTextField(
        // TODO add validator for the input fields
        hintText: emailOrPseudoHintText,
        controller: emailOrPseudoController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

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

  Widget buildPasswordTextField() {
    return ConnectionPasswordTextField(
        hintText: passwordHintText,
        controller: passwordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildConfirmPasswordTextField() {
    return ConnectionPasswordTextField(
        hintText: confirmPasswordHintText,
        controller: confirmPasswordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildConnectionButton() {
    return DefaultConnectionButton(
        text: connectionButtonText,
        textColor: AppColors.black,
        backgroundColor: AppColors.white,
        borderColor: AppColors.primaryColorAccent,
        onPressed: () {
          // TODO add the logic to connect the user
        });
  }

  Widget buildTermsAndConditionsButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return LegalTermsScreen();
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
      ),
      child: Text(
        legalConditionsButtonText,
        style: const TextStyle(
          color: AppColors.white,
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
        Checkbox(
          value: _agreeWithTermsAndConditions,
          onChanged: (bool? value) {
            // TODO add the logic to accept the terms and conditions
            setState(() {
              _agreeWithTermsAndConditions = value!;
            });
          },
        ),
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

// column
// email
// password
// confirm password
// i agree to the terms and conditions
// register button
}
