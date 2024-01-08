import 'package:stud_advice/stud_advice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RoadMapView extends StatelessWidget {
  final String administrativeProcessId;
  final String administrativeProcessName;
  final String administrativeProcessDescription;
  StepController stepController = Get.find();
  PanelController panelController = PanelController();

  
  RoadMapView({
      super.key,
      required this.administrativeProcessId,
      required this.administrativeProcessName,
      required this.administrativeProcessDescription,
  });

  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    } else {
      return text[0].toUpperCase() + text.substring(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color roadmapBackgroundColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.roadmapBackgroundColorDark
        : AppColors.roadmapBackgroundColorLight;

    stepController.setProcessTitle(capitalize(administrativeProcessName));
    stepController.setProcessDescription(administrativeProcessDescription);
    return Scaffold(
      backgroundColor: roadmapBackgroundColor,
      appBar: _buildAppBar(togglePanel),
      body: Stack(
        children: [
          CustomSlidingUpPanel(
            panelController: panelController,
            bodyContent: GestureDetector(
              onTap: () {
                panelController.close();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: StepsIndicator(
                  currentStep: stepController.currentStep.value,
                  steps: stepController.steps,
                  administrativeProcessId: administrativeProcessId,
                ),
              ),
            ),
            title: stepController.getProcessTitle(),
            slidingWidget: StepDetailCardWidget(
                title: stepController.getProcessTitle(),
                description: stepController.getProcessDescription(),
                onNextPressed: () {},
                onCompletePressed: () async {
                  await stepController.resetStepProgression(administrativeProcessId);
                  await stepController.setAndAddMetadataToStep(stepController.steps, administrativeProcessId);
                  stepController.update();
                },
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

  PreferredSizeWidget _buildAppBar(VoidCallback onInfoPress) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(Get.context!).pop();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: onInfoPress,
        ),
      ],
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}
