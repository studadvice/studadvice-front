import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';

class InformationModalController extends CustomSearchController {
  var showAlternateContent = false.obs;
  var alternateContent = "".obs;

  void toggleContent() {
    showAlternateContent.value = !showAlternateContent.value;
  }
  
  void setAlternateContent(String content) {
    alternateContent.value = content;
  }
  
  String getAlternateContent() {
    return alternateContent.value;
  }
}