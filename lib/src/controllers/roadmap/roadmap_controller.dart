import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';


class RoadMapController extends CustomSearchController {

  final _dio = Get.find<Dio>();
  
}
