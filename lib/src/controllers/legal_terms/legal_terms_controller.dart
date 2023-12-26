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
                  buildTermsAndConditionsButton(''),
                  buildTermsAndConditionsRow(''),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget buildTermsAndConditionsButton(String tr) {
    return GestureDetector(
      onTap: () {
        Get.to(() => LegalTermsScreen());
      },
      child: Text(
        i18n.text('legalConditionsButton'),
        style: const TextStyle(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSizes.medium,
        ),
      ),
    );
  }

  Widget buildTermsAndConditionsRow(String tr) {
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
          i18n.text('acceptTermsAndConditions'),
          style: const TextStyle(
            fontSize: AppFontSizes.medium,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }

  SnackbarController getSnackbarController(String tr, String tr2) {
    return Get.snackbar(
      i18n.text('termsAndConditions'),
      i18n.text('acceptTermsAndConditionsError'),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      titleText: Text(
        i18n.text('termsAndConditions'),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        i18n.text('acceptTermsAndConditionsError'),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSizes.medium,
        ),
      ),
      backgroundColor: AppColors.dangerColor,
    );
  }
}
