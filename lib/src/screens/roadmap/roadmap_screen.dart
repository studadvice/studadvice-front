import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/src/widgets/common/paints/step_detail/step_detail_card_widget.dart';
import 'package:stud_advice/stud_advice.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final int currentStep;
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
                  padding: const EdgeInsets.all(0.0),
                  child: StepsIndicator(
                    currentStep: stepController.currentStep.value,
                    steps: stepController.steps,
                  ),
                ),
              )
            ),
          Expanded(
            flex: 1,
            child: Obx(() {
              StepItem currentStepItem = stepController.steps[stepController.currentStep.value];
              return StepDetailCardWidget(
                title: currentStepItem.title,
                description: currentStepItem.description,
                onNextPressed: () {
                  if (stepController.currentStep.value == stepController.steps.length - 1) {
                    Get.offAllNamed(HomePageScreen.navigatorId);
                  } else {
                    stepController
                        .changeStep(stepController.currentStep.value + 1);
                  }
                },
                onCompletePressed: () {
                  stepController.completeStep(stepController.currentStep.value);
                },
                actionText: "Next",
              );
            }),
          ),
        ],
      ),
    );
  }
}
