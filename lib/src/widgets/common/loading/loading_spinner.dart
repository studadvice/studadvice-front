import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore.dart';

class LoadingSpinner {
  static void start() {
    Get.dialog(const Center(
      child: CircularProgressIndicator(
        color: AppColors.secondaryColor,
        strokeWidth: 5,
      ),
    ));
  }

  static void stop() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
