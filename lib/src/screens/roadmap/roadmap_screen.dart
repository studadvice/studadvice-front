import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:shimmer/shimmer.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final I18n _i18n = Get.find();
  final int currentStep;
  
  final String admnistrativeProcessName;

  final RoadMapController roadMapController = Get.find<RoadMapController>();
  final StepController stepController = Get.find<StepController>();
  

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
    final String administrativeProcessDescription = args['administrativeProcessDescription'] ?? '';
    final List<StepItem> steps = args['steps'] ?? [];
    // set the steps
    stepController.setSteps(steps);

    return FutureBuilder(
      future: stepController.setAndAddMetadataToStep(steps, administrativeProcessId),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: RoadMapShimmer());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return RoadMapView(
            administrativeProcessId: administrativeProcessId,
            administrativeProcessName: administrativeProcessName,
            administrativeProcessDescription: administrativeProcessDescription,
          );
        }
      },
    );
  }
}