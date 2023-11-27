import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSelectionModalController extends GetxController {
  final List<String> itemsList;
  TextEditingController searchController = TextEditingController();
  final RxList<String> _filteredItems = <String>[].obs;

  CustomSelectionModalController(this.itemsList) {
    _filteredItems.assignAll(itemsList);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    searchController.addListener(() {
      filterItems(searchController.text);
    });
    super.onInit();
  }

  List<String> get filteredItems => _filteredItems;

  set filteredItems(List<String> value) => _filteredItems.assignAll(value);

  void filterItems(String filter) {
    if (filter.isEmpty) {
      _filteredItems.assignAll(itemsList);
    } else {
      _filteredItems.assignAll(itemsList
          .where((item) => item.toLowerCase().contains(filter.toLowerCase()))
          .toList());
    }
  }
}
