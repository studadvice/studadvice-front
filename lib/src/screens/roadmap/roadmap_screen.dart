import 'package:flutter/material.dart';
import 'package:stud_advice/src/models/step/step_item_data.dart';
import 'package:stud_advice/src/widgets/common/paints/curved_dottedline/curved_dottedline_paint.dart';
import 'package:stud_advice/src/widgets/common/paints/step_number/step_number_widget.dart';
import 'package:stud_advice/src/widgets/common/paints/steps_indicator_widget.dart';

class RoadMapScreen extends StatelessWidget {
  static const navigatorId = '/roadmap';
  final int stepCount;
  final int currentStep;
  List<StepItem> steps = [
    StepItem(number: 1, title: 'Step 1', isCompleted: true, color: Colors.green),
    StepItem(number: 2, title: 'Step 2', isCompleted: true, color: Colors.lightBlue),
    StepItem(number: 3, title: 'Step 3', isCompleted: true, color: Colors.blue),
    StepItem(number: 4, title: 'Step 4', isCompleted: true, color: Colors.orange),
    StepItem(number: 5, title: 'Step 4', isCompleted: true, color: Colors.green),
    StepItem(number: 6, title: 'Step 4', isCompleted: true, color: Colors.lightBlue),
    StepItem(number: 7, title: 'Step 4', isCompleted: true, color: Colors.orange),
  ];

  RoadMapScreen({
    super.key,
    required this.stepCount,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // add margin left and right
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: StepsIndicator(
              stepCount: stepCount,
              currentStep: currentStep,
              steps: steps,
            ),
          ),
        )
      ),
    );
  }
}
