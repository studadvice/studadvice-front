import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';

class StepController extends CustomSearchController {

  final ScrollController scrollController = ScrollController();
  List<StepItem> steps = [];
  String processDescription = "";
  String processTitle = "";

  var currentStep = 0.obs;
  UserStorageController userStorageController = Get.find();

  StepController() {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double scrollPosition = scrollController.offset;
    int newStep = (scrollPosition / 100).round();

    if (currentStep.value != newStep && newStep < steps.length && newStep >= 0) {
      currentStep.value = newStep;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }

  String getProcessDescription() {
    return processDescription;
  }

  String getProcessTitle() {
    return processTitle;
  }

  void setProcessDescription(String description) {
    processDescription = description;
    update();
  }

  void setProcessTitle(String title) {
    processTitle = title;
    update();
  }

  void setSteps(List<StepItem> steps) {
    this.steps = steps;
    update();
  }

  Future<void> completeStep(int stepIndex, String administrativeProcessId,String categoryId) async {
    print(stepIndex);
    if (stepIndex == steps.length){
      currentStep.value = stepIndex;
      await _saveStepProgressToFirebase(
          stepIndex, administrativeProcessId, categoryId);
    }
    else {
      if (!steps[stepIndex].isCompleted!) {
        steps[stepIndex].isCompleted = true;
        currentStep.value = stepIndex;
        update();

        await _saveStepProgressToFirebase(
            stepIndex, administrativeProcessId, categoryId);
      }
    }
  }

  Future<void> _saveStepProgressToFirebase(int stepIndex, String administrativeProcessId, String categoryId) async {
    try {
      String userId = userStorageController.getCurrentUserId();
      await userStorageController.addStepProgressionToUser(userId, administrativeProcessId, stepIndex, steps.length,categoryId);
    } catch (error) {
      print("Error while saving step progression to firebase: $error");
    }
  }

  Future<void> setAndAddMetadataToStep(List<StepItem> steps, String administrativeProcessId) async {
    List<Color> colors = [const Color(0xFF8ECAE6), const Color(0xFF219EBC), const Color(0xFF023047), const Color(0xFFFFB703)];
    List<Color> borderColors = [const Color(0xFF8ECAE6), const Color(0xFF8ECAE6), const Color(0xFF219EBC),const Color(0xFFFB8500)];
    String userId = userStorageController.getCurrentUserId();
  
    int? stepIndex = await userStorageController.getStepIndex(userId, administrativeProcessId);
    stepIndex ??= 0;
    for (int i = 0; i < steps.length; i++) {
      steps[i].color = colors[i % colors.length];
      steps[i].borderColor = borderColors[i % borderColors.length];
      if (i <= stepIndex) {
        steps[i].isCompleted = true;
      } else {
        steps[i].isCompleted = false;
      }
    }
  }

  Future<void> resetStepProgression(String administrativeProcessId, String categoryId) async {
    String userId = userStorageController.getCurrentUserId();
    await userStorageController.resetStepProgression(userId, administrativeProcessId, steps.length,categoryId);
  }
  
}