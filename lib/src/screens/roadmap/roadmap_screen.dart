import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final I18n _i18n = Get.find();
  final int currentStep;
  
  final String admnistrativeProcessName;

  final RoadMapController roadMapController = Get.put(RoadMapController());
  StepController stepController = Get.put(StepController());
  

  RoadMapScreen({
    super.key,
    required this.currentStep,
    required this.admnistrativeProcessName,
  });

  @override
  Widget build(BuildContext context) {
    // get the road map arguments
    final Map<String, dynamic> args = Get.arguments;
    final String administrativeProcessId = args['administrativeProcessId'] ?? '';
    final String administrativeProcessName = args['administrativeProcessName'] ?? '';
    final List<StepItem> steps = args['steps'] ?? [];
    // set the steps
    stepController.setSteps(steps);
    // add metadata to the steps
    setAndAddMetadataToStep(steps);
    return Scaffold(
      appBar: CustomSearchAppBar(
          controller: roadMapController,
          hintText: 'step.search'.tr),
      body: RoadMapView(
        administrativeProcessId: administrativeProcessId,
        administrativeProcessName: administrativeProcessName,
      ),
    );
  }
  
  void setAndAddMetadataToStep(List<StepItem> steps) {
    List<Color> colors = [Colors.green, Colors.lightBlue, Colors.blue, Colors.orange];

    for (int i = 0; i < steps.length; i++) {
      steps[i].color = colors[i % colors.length];
      steps[i].isCompleted = true;
    }
  }
  
  
  
}