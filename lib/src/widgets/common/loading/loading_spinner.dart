import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingSpinner {
  static void start() {
    Get.dialog(const Center(
      child: CircularProgressIndicator.adaptive(
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
