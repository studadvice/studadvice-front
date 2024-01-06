import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class StepController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final _dio = Get.find<Dio>();
  RxList<StepProcess> steps = <StepProcess>[].obs;

  Future<AdministrativeProcessContent> _getAdministrativeProcessById(
      String path) async {
    try {
      final response = await _dio.get(
        path,
      );
      if (response.statusCode == HttpStatus.ok) {
        return AdministrativeProcessContent.fromJson(response.data);
      } else {
        throw Exception('Failed to load administrative process');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<AdministrativeProcessContent> getAdministrativeProcessById({
    required String id,
  }) async {
    return _getAdministrativeProcessById('/administrative-process/$id');
  }

  var currentStep = 0.obs;

  StepController() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double scrollPosition = scrollController.offset;
    int newStep = (scrollPosition / 100).round();

    if (currentStep.value != newStep &&
        newStep < steps.length &&
        newStep >= 0) {
      currentStep.value = newStep;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }

  void completeStep(int value) {
    steps[value].isCompleted = true;
    update();
  }
}
