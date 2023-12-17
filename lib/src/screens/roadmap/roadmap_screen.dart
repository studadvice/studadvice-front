import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final int currentStep;
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
  final StepController stepController = Get.put(StepController());

  RoadMapScreen({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child:  Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: StepsIndicator(
                    currentStep: stepController.currentStep.value,
                    steps: steps,
                  ),
                ),
              )
            ),
          const Divider(
            thickness: 0.3,
            indent: 5,
            endIndent: 5,
          ),
          Expanded(
            flex: 1,
            child: Obx(() {
              StepItem currentStepItem = steps[stepController.currentStep.value];
              print(currentStepItem.description);
              return Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentStepItem.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      currentStepItem.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          text: "Next",
                          textColor: AppColors.white,
                          backgroundColor: AppColors.primaryColorAccent,
                          onPressed: () {
                            if (stepController.currentStep.value == steps.length - 1) {
                              Get.offAllNamed(HomePageScreen.navigatorId);
                              return;
                            }
                            stepController.changeStep(stepController.currentStep.value + 1);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
