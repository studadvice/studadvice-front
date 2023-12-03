import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class LegalTermsController extends GetxController {
  var agreeWithTermsAndConditions = false.obs;
  I18n i18n = Get.find();

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
        i18n.text('legalConditionsButtonText'),
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
          i18n.text('acceptTermsAndConditionsText'),
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
    return Get.snackbar(
      i18n.text('termsAndConditionsText'),
      i18n.text('acceptTermsAndConditionsErrorText'),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      titleText: Text(
        i18n.text('termsAndConditionsText'),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        i18n.text('acceptTermsAndConditionsErrorText'),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
        ),
      ),
      backgroundColor: AppColors.dangerColor,
    );
  }
}
