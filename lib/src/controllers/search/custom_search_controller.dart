import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomSearchController extends GetxController {
  final Rx<String> searchQuery = "".obs;
  final TextEditingController textEditingController = TextEditingController();

  void change() {
    searchQuery.value = textEditingController.text;
    update();
  }

  Future<void> fetchPage(int pageKey) async {
  }
}
