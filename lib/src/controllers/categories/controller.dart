import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stud_advice/src/models/stud_advice/category.dart';

abstract class CustomSearchController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final PagingController<int, CategoryContent> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey);
}
