import 'package:get/get.dart';

class NavigationHelper {
  static Future<void> navigateTo(String route) async {
    Get.rootDelegate.toNamed(route);
  }
}
