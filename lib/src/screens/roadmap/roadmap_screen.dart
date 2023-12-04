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
      appBar: CustomAppBar(
      title: "Roadmap",
      onBackPress: () => Get.back(),
      onInfoPress: togglePanel,
    ),
    body: Stack(
        children: [
          CustomSlidingUpPanel(
            panelController: panelController,
            bodyContent: GestureDetector(
              onTap: () {
                panelController.close();
              },
              child: StepsIndicator(
                currentStep: stepController.currentStep.value,
                steps: stepController.steps,
              ),
            ),
            title: stepController.getProcessTitle(),
            slidingWidget: StepDetailCardWidget(
              title: stepController.getProcessTitle(),
              description: stepController.getProcessDescription(),
              onNextPressed: () {},
              onCompletePressed: () {},
              actionText: "Next",
            ),
          ),
        ],
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