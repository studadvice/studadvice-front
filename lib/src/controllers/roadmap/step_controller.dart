import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:stud_advice/src/controllers/search/custom_search_controller.dart';

class StepController extends CustomSearchController {

  final ScrollController scrollController = ScrollController();
  final _dio = Get.find<Dio>();
  List<StepItem> steps = [
    StepItem(
        stepNumber: 1,
        name: 'Titre de séjour',
        isCompleted: true,
        color: Colors.green,
        description: "Pour obtenir un titre de séjour, vous devez vous rendre à la préfecture de votre lieu de résidence."
    ),
    StepItem(
        stepNumber: 2,
        name: 'Ouverture d’un compte bancaire',
        isCompleted: true,
        color: Colors.lightBlue,
        description: "Pour ouvrir un compte bancaire, vous devez vous rendre à la banque de votre choix."
    ),
    StepItem(
        stepNumber: 3,
        name: 'Sécurité sociale',
        isCompleted: true,
        color: Colors.blue,
        description: "Pour obtenir un numéro de sécurité sociale, vous devez vous rendre à la CPAM de votre lieu de résidence."
    ),
    StepItem(
        stepNumber: 4,
        name: 'CAF',
        isCompleted: true,
        color: Colors.orange,
        description: "Pour beneficier des aides de la CAF, vous devez vous rendre à la CAF de votre lieu de résidence."
    ),
    StepItem(
        stepNumber: 5,
        name: 'Assurance logement',
        isCompleted: false,
        color: Colors.green,
        description: "Pour obtenir une assurance logement, vous devez vous rendre à l’assurance de votre choix."
    ),
    StepItem(
        stepNumber: 6,
        name: 'Inscription à la fac',
        isCompleted: false,
        color: Colors.lightBlue,
        description: "Pour vous inscrire à la fac, vous devez vous rendre à la fac de votre choix."
    ),
    StepItem(
        stepNumber: 7,
        name: 'Inscription à la bibliothèque',
        isCompleted: false,
        color: Colors.orange,
        description: "Pour vous inscrire à la bibliothèque, vous devez vous rendre à la bibliothèque de votre choix."
    ),
  ];

  var currentStep = 0.obs;

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

  void completeStep(int value) {
    steps[value].isCompleted = true;
    update();
  }

  String getProcessDescription() {
    return "Pour obtenir un titre de séjour, vous devez vous rendre à la préfecture de votre lieu de résidence.";
  }

  String getProcessTitle() {
    return "Titre de séjour";
  }

  void setSteps(List<StepItem> steps) {
    this.steps = steps;
    update();
  }
}