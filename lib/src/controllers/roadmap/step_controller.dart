import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class StepController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final _dio = Get.find<Dio>();
  RxList<StepProcess> steps = <StepProcess>[].obs;
  final DeeplTranslatorController _deeplTranslatorController =
      Get.find<DeeplTranslatorController>();

  Future<AdministrativeProcessContent> _getAdministrativeProcessById(
      String path) async {
    try {
      final response = await _dio.get(
        path,
      );
      if (response.statusCode == HttpStatus.ok) {
        var process = AdministrativeProcessContent.fromJson(response.data);
        if (process.steps != null) {
          for (var step in process.steps!) {
            step.name =
                await _deeplTranslatorController.translateText(step.name);
            step.description = await _deeplTranslatorController
                .translateText(step.description);
          }
        }
        return process;
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

  Future<void> _scrollListener() async {
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
