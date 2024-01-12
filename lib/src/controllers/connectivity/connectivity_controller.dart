import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = (result != ConnectivityResult.none);
      showConnectionSnackbar();
    });
  }

  void showConnectionSnackbar() {
    String message = isConnected.value
        ? "connectivity.connectionRestoredText".tr
        : "connectivity.noInternetText".tr;

    Get.snackbar(
      "connectivity.status".tr,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
