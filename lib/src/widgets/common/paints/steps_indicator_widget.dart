import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class StepsIndicator extends StatelessWidget {
  final int stepCount;
  final int currentStep;
  final List<StepItem> steps;
  static double DIAMETER = 100.0;


  const StepsIndicator({
        super.key,
        required this.stepCount,
        required this.currentStep,
        required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          int stepNumber = index + 1;
          bool isLeftAligned = stepNumber % 2 != 0;
          StepItem step = steps[index];

          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double screenWidth = constraints.maxWidth;
              double stepWidgetDiameter = DIAMETER;
              double curveWidth = screenWidth - stepWidgetDiameter;

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      StepNumberWidget(
                        stepNumber: stepNumber,
                        diameter: stepWidgetDiameter,
                        color: step.color,
                        isEnabled: step.isCompleted,
                        onPressed: () {
                          print('Step $stepNumber pressed');
                        },
                      ),
                    ],
                  ),
                  if (index < steps.length - 1)
                    CustomPaint(
                      size: Size(curveWidth, curveWidth/2.6),
                      painter: CurvedDottedLinePainter(
                        color: Colors.grey,
                        strokeWidth: 2.0,
                        isLeft: !isLeftAligned,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}