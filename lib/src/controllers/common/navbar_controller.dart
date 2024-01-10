import 'package:get/get.dart';

class NavBarController extends GetxController {
  var tabIndex = 2;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void resetTabIndex() {
    tabIndex = 2;
    update();
  }
}
