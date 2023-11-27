import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class ConnectivityController extends GetxController {
  var isConnected = true.obs;
  final String noInternetText = "Pas de connexion internet";
  final String checkConnectionText =
      "Veuillez vérifier votre connexion internet.";
  final String connectionRestoredText = "Connexion rétablie";
  final String connectionRestoredMessage =
      "Vous êtes à nouveau connecté à Internet.";

  void checkConnectivity(ConnectivityResult result) {
    isConnected.value = result != ConnectivityResult.none;
    showConnectivitySnackbar();
  }

  void showConnectivitySnackbar() {
    if (!isConnected.value) {
      Get.snackbar(
        noInternetText,
        checkConnectionText,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.dangerColor,
        duration: const Duration(seconds: 5),
      );
    } else {
      Get.snackbar(
        connectionRestoredText,
        connectionRestoredMessage,
        colorText: AppColors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColorAccent,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
