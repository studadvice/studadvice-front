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
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child:  Container(
                // add margin left and right
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: StepsIndicator(
                    stepCount: stepCount,
                    currentStep: currentStep,
                    steps: steps,
                  ),
                ),
              )
            ),
          const Divider(
            thickness: 0.3,
            indent: 5,
            endIndent: 5,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Step 1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'This is a detailed description of step 1. Here you can put more information about the step and what the user is supposed to do.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 80),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Action 1'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
