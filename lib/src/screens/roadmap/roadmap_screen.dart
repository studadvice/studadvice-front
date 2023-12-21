import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';


class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final int currentStep;
  final StepController stepController = Get.put(StepController());
  final PanelController panelController = PanelController();

  RoadMapScreen({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Roadmap",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => togglePanel,
          ),
        ],
      ),
    body: GestureDetector(
      onTap: () {
      if (panelController.isPanelOpen) {
          panelController.close();
      }
    },
      child: Stack(
        children: [
          // Your main content goes here
          CustomSlidingUpPanel(
            panelController: panelController,
            bodyContent: StepsIndicator(
              currentStep: stepController.currentStep.value,
              steps: stepController.steps,
            ),
            slidingWidget: StepDetailCardWidget(
              title: stepController.getProcessTitle(),
              description: stepController.getProcessDescription(),
              onNextPressed: () {},
              onCompletePressed: () {},
              actionText: "Next",
            ),
            title: stepController.getProcessTitle(),
          ),
        ],
      ),
    ),
    );
  }

  void togglePanel() {
    if (panelController.isPanelOpen) {
      panelController.close();
    } else {
      panelController.open();
    }
  }
}