import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore.dart';

class ConnectivityController extends GetxController {
  var isConnected = true.obs;

  void checkConnectivity(ConnectivityResult result) {
    isConnected.value = result != ConnectivityResult.none;
    showConnectivitySnackbar();
  }

  void showConnectivitySnackbar() {
    if (!isConnected.value) {
      Get.snackbar(
        "connectivity.noInternetText".tr,
        "connectivity.checkConnectionText".tr,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.dangerColor,
        duration: const Duration(seconds: 5),
      );
    } else {
      Get.snackbar(
        "connectivity.connectionRestoredText".tr,
        "connectivity.connectionRestoredMessage".tr,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColorAccent,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
