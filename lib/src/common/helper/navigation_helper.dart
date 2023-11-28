import 'package:get/get.dart';

class NavigationHelper {
  static Future<void> navigateTo(String route, [dynamic arguments]) async {
    Get.rootDelegate.toNamed(route, arguments: arguments);
  }
}
