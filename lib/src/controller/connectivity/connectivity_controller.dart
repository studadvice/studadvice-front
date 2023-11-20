import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/common/chore/app_colors.dart';

class ConnectivityController extends GetxController {
  var isConnected = true.obs;
  final String noInternetText = "Pas de connexion internet";
  final String checkConnectionText =
      "Vérifiez votre connexion, puis rafraîchissez la page.";
  final String connectionRestoredText = "Connexion rétablie";
  final String connectionRestoredMessage =
      "Vous êtes à nouveau connecté à Internet.";

  @override
  void onInit() {
    super.onInit();
    // TODO improve the way and when to get the connectivity status
    Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = (result != ConnectivityResult.none);
      showConnectivitySnackbar();
    });
  }

  void showConnectivitySnackbar() {
    if (!isConnected.value) {
      Get.snackbar(
        noInternetText,
        checkConnectionText,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.dangerColor,
        duration: const Duration(seconds: 5),
      );
    } else {
      Get.snackbar(
        connectionRestoredText,
        connectionRestoredMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryColorAccent,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
