import 'package:get/get.dart';

class CustomSearchBarController extends GetxController {
  Rx<bool> isListening = false.obs;

  void setState(bool newState) {
    isListening.value = newState;
  }

}