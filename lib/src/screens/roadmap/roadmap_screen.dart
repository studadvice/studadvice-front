import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';

import '../../widgets/common/paints/step_detail/step_detail_card_widget.dart';

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
      body: SlidingUpPanel(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        maxHeight: 300,
        panel: StepDetailCardWidget(
            title: stepController.getProcessTitle(),
            description: stepController.getProcessDescription(),
            onNextPressed: () {
            },
            onCompletePressed: () {
            },
            actionText: "Next",
    ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: StepsIndicator(
              currentStep: stepController.currentStep.value,
              steps: stepController.steps,
            ),
          ),
        ),
      ),
    );
  }
}
