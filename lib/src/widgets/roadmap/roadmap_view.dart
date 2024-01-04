import 'package:stud_advice/stud_advice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RoadMapView extends StatelessWidget {
  final String administrativeProcessId;
  final String administrativeProcessName;
  StepController stepController = Get.put(StepController());
  PanelController panelController = PanelController();

  
  RoadMapView({
      super.key,
      required this.administrativeProcessId,
      required this.administrativeProcessName,
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
      
      return Scaffold(
        appBar: buildAppBar(administrativeProcessName, togglePanel),
        body: Stack(
          children: [
            CustomSlidingUpPanel(
              panelController: panelController,
              bodyContent: GestureDetector(
                onTap: () {
                  panelController.close();
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: StepsIndicator(
                    currentStep: stepController.currentStep.value,
                    steps: stepController.steps,
                  ),
                ),
              ),
              title: stepController.getProcessTitle(),
              slidingWidget: StepDetailCardWidget(
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

    PreferredSizeWidget buildAppBar(String title, VoidCallback onInfoPress) {
      return AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: AppColors.black),
            onPressed: onInfoPress,
          ),
        ],
        backgroundColor: AppColors.white,
        elevation: 4,
        automaticallyImplyLeading: false,
      );
  }
}
