import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';

class RoadMapShimmer extends StatelessWidget {
  String administrativeProcessId;
  String administrativeProcessName;
  String administrativeProcessDescription;
  StepController stepController = Get.find();
  PanelController panelController = PanelController();

  RoadMapShimmer({
    super.key,
    this.administrativeProcessId = '',
    this.administrativeProcessName = '',
    this.administrativeProcessDescription = '',
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
    stepController.setProcessTitle(capitalize(administrativeProcessName));
    stepController.setProcessDescription(administrativeProcessDescription);
    return Scaffold(
      backgroundColor: AppColors.grey[200],
      appBar: _buildAppBar(togglePanel),
      body: Stack(
        children: [
          CustomSlidingUpPanel(
            panelController: panelController,
            bodyContent: GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ShimmerStepsIndicator(
                  currentStep: stepController.currentStep.value,
                  steps: stepController.steps,
                  administrativeProcessId: administrativeProcessId,
                ),
              ),
            ),
            title: stepController.getProcessTitle(),
            slidingWidget: ShimmerStepDetailCardWidget(
              title: stepController.getProcessTitle(),
              description: stepController.getProcessDescription(),
              onNextPressed: () {},
              onCompletePressed: () {},
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
