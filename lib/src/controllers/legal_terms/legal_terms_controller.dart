import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class LegalTermsController extends GetxController {
  var agreeWithTermsAndConditions = false.obs;

  void showTermsAndConditionsDialog(BuildContext context,
      String legalConditionsButtonText, String acceptTermsAndConditionsText) {
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
                  buildTermsAndConditionsButton(
                    legalConditionsButtonText,
                  ),
                  buildTermsAndConditionsRow(acceptTermsAndConditionsText),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget buildTermsAndConditionsButton(String legalConditionsButtonText) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(LegalTermsScreen.navigatorId);
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

  Widget buildTermsAndConditionsRow(String acceptTermsAndConditionsText) {
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

  SnackbarController getSnackbarController(
      String acceptTermsAndConditionsErrorText, String termsAndConditionsText) {
    return Get.snackbar(
      termsAndConditionsText,
      acceptTermsAndConditionsErrorText,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      titleText: Text(
        termsAndConditionsText,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        acceptTermsAndConditionsErrorText,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
        ),
      ),
      backgroundColor: AppColors.dangerColor,
    );
  }
}
