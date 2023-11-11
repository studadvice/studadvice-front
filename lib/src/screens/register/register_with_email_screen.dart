import 'package:flutter/material.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/screens/legal_conditions/legal_conditions_screen.dart';
import 'package:stud_advice/src/screens/register/register_user_information_screen.dart';
import 'package:stud_advice/src/widgets/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/textFields/classic_text_field.dart';
import 'package:stud_advice/src/widgets/textFields/password_text_field.dart';

class RegisterWithEmailScreen extends StatefulWidget {
  static const String navigatorId = 'register_with_email_screen';

  const RegisterWithEmailScreen({super.key});

  @override
  State<RegisterWithEmailScreen> createState() =>
      _RegisterWithEmailScreenState();
}

class _RegisterWithEmailScreenState extends State<RegisterWithEmailScreen> {
  // State variables.
  bool _agreeWithTermsAndConditions = false;

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
        body: ListView(
          // Wrap in a ListView to avoid overflow when the keyboard is displayed.
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
                child: Column(
              children: [
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
            )),
          ],
        ),
      );

  Widget buildEmailTextField() {
    return ClassicTextField(
      // TODO add validator for the input fields
      hintText: emailHintText,
      labelText: emailLabelText,
      controller: emailOrPseudoController,
      backgroundColor: AppColors.white,
      focusedBorderColor: AppColors.secondaryColor,
      keyboardType: TextInputType.emailAddress,
      borderColor: AppColors.secondaryColor,
    );
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
    return PasswordTextField(
        hintText: passwordHintText,
        labelText: passwordLabelText,
        controller: passwordController,
        backgroundColor: AppColors.white,
        focusedBorderColor: AppColors.secondaryColor,
        borderColor: AppColors.secondaryColor);
  }

  Widget buildConfirmPasswordTextField() {
    return PasswordTextField(
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
        onPressed: () {
          // TODO add the logic to connect the user
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegisterUserInformationScreen()));
        });
  }

  Widget buildTermsAndConditionsButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return LegalTermsScreen();
            },
          ),
        );
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
        Checkbox(
          value: _agreeWithTermsAndConditions,
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
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
}
