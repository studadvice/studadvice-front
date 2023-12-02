import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/common/chore/form_validator.dart';
import 'package:stud_advice/src/controllers/forgot_password/forgot_password_controller.dart';
import 'package:stud_advice/src/widgets/common/buttons/default_connection_button.dart';
import 'package:stud_advice/src/widgets/common/textFields/classic_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String navigatorId = '/forgot_password_screen';

  final ForgotPasswordController _forgotPasswordController =
      Get.put(ForgotPasswordController());

  final String forgotPasswordTitle = 'Mot de passe oublié';
  final String emailHintText = 'Email';
  final String emailLabelText = 'Email';
  final String sendText = 'Envoyer';
  final String emailErrorText = 'Veuillez entrer votre adresse e-mail';
  final String forgotPasswordMessageText =
      'Veuillez entrer votre adresse e-mail pour recevoir un lien de réinitialisation du mot de passe.';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      GetBuilder<ForgotPasswordController>(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(child: Text(forgotPasswordTitle)),
            ),
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
                  const Image(
                    image: AssetImage(
                        'assets/images/forgot_password/forgot_password_logo.png'),
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      forgotPasswordMessageText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: AppFontSizes.large18,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClassicTextField(
                    controller: _forgotPasswordController.emailController,
                    hintText: emailHintText,
                    labelText: emailLabelText,
                    validator: (value) => FormValidator.validateEmail(value),
                    autofillHints: [AutofillHints.email],
                    backgroundColor: AppColors.white,
                    focusedBorderColor: AppColors.blue,
                    borderColor: AppColors.blue,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultConnectionButton(
                        text: sendText,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _forgotPasswordController.resetPassword();
                          }
                        },
                        textColor: AppColors.white,
                        backgroundColor: AppColors.blue),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
