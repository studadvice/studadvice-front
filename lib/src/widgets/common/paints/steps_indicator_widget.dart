import 'package:flutter/material.dart';
import 'package:stud_advice/src/models/step/step_item_data.dart';
import 'package:stud_advice/src/widgets/common/paints/curved_dottedline/curved_dottedline_paint.dart';
import 'package:stud_advice/src/widgets/common/paints/step_number/step_number_widget.dart';

class StepsIndicator extends StatelessWidget {
  final int stepCount;
  final int currentStep;
  final List<StepItem> steps;


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
              double stepWidgetDiameter = 100;
              double curveWidth = screenWidth - stepWidgetDiameter;

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      StepNumberWidget(
                        stepNumber: stepNumber,
                        diameter: stepWidgetDiameter,
                        color: step.backgroundColor,
                      ),
                    ],
                  ),
                  if (index < stepCount - 1)
                    CustomPaint(
                      size: Size(curveWidth, curveWidth/2),
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