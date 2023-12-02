import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';
import 'package:stud_advice/src/common/chore/app_fonts_sizes.dart';
import 'package:stud_advice/src/screens/legal_terms/legal_conditions_screen.dart';

class LegalTermsController extends GetxController {
  var agreeWithTermsAndConditions = false.obs;

  final String legalConditionsButtonText = 'Voir les Termes et Conditions';
  final String acceptTermsAndConditionsText =
      'J\'accepte les conditions générales d\'utilisation';
  final String acceptTermsAndConditionsErrorText =
      'Veuillez accepter les termes et conditions';
  final String termsAndConditionsText = 'Termes et Conditions';

  void showTermsAndConditionsDialog(BuildContext context) {
    if (!agreeWithTermsAndConditions.value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(16),
            backgroundColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTermsAndConditionsButton(),
                  buildTermsAndConditionsRow(),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget buildTermsAndConditionsButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => LegalTermsScreen());
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
        Obx(() => Checkbox(
              value: agreeWithTermsAndConditions.value,
              activeColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (bool? value) {
                agreeWithTermsAndConditions.value = value!;
              },
            )),
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

  SnackbarController getSnackbarController() {
    const String acceptTermsAndConditionsErrorText =
        'Veuillez accepter les termes et conditions';
    const String termsAndConditionsText = 'Termes et Conditions';

    return Get.snackbar(
      termsAndConditionsText,
      acceptTermsAndConditionsErrorText,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      titleText: const Text(
        termsAndConditionsText,
        style: TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: const Text(
        acceptTermsAndConditionsErrorText,
        style: TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
        ),
      ),
      backgroundColor: AppColors.dangerColor,
    );
  }
}
