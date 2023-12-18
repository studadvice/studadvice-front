import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomSearchController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxBool showSearchCategories = false.obs;

  void onSearchTextChanged(String text) {
    showSearchCategories.value = text.isNotEmpty;
    update();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
