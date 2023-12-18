import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class StepController extends GetxController {

  final ScrollController scrollController = ScrollController();
  final _dio = Get.find<Dio>();
  List<StepItem> steps = [
    StepItem(
        number: 1,
        title: 'Titre de séjour',
        isCompleted: true,
        color: Colors.green,
        description: "Pour obtenir un titre de séjour, vous devez vous rendre à la préfecture de votre lieu de résidence."
    ),
    StepItem(
        number: 2,
        title: 'Ouverture d’un compte bancaire',
        isCompleted: true,
        color: Colors.lightBlue,
        description: "Pour ouvrir un compte bancaire, vous devez vous rendre à la banque de votre choix."
    ),
    StepItem(
        number: 3,
        title: 'Sécurité sociale',
        isCompleted: true,
        color: Colors.blue,
        description: "Pour obtenir un numéro de sécurité sociale, vous devez vous rendre à la CPAM de votre lieu de résidence."
    ),
    StepItem(
        number: 4,
        title: 'CAF',
        isCompleted: true,
        color: Colors.orange,
        description: "Pour beneficier des aides de la CAF, vous devez vous rendre à la CAF de votre lieu de résidence."
    ),
    StepItem(
        number: 5,
        title: 'Assurance logement',
        isCompleted: true,
        color: Colors.green,
        description: "Pour obtenir une assurance logement, vous devez vous rendre à l’assurance de votre choix."
    ),
    StepItem(
        number: 6,
        title: 'Inscription à la fac',
        isCompleted: true,
        color: Colors.lightBlue,
        description: "Pour vous inscrire à la fac, vous devez vous rendre à la fac de votre choix."
    ),
    StepItem(
        number: 7,
        title: 'Inscription à la bibliothèque',
        isCompleted: true,
        color: Colors.orange,
        description: "Pour vous inscrire à la bibliothèque, vous devez vous rendre à la bibliothèque de votre choix."
    ),
  ];

  var currentStep = 0.obs;

  StepController() {
    scrollController.addListener(_scrollListener);
  }

  void changeStep(int index) {
    double stepPosition = index * 100.0;
    currentStep.value = index;

    scrollController.animateTo(
      stepPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
}
