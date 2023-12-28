import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CustomSearchController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();

  Future<void> fetchFavoritesPage(int pageKey);
}
