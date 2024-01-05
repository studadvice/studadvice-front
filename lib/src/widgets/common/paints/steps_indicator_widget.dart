import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/common/paints/step_number/step_number_widget.dart';
import '../../../../stud_advice.dart';
import '../modals/information_modal.dart';
import 'curved_dottedline/curved_dottedline_paint.dart';

class StepsIndicator extends StatelessWidget {
  final int currentStep;
  final List<StepProcess> steps;
  static double DIAMETER = 75.0;


  StepsIndicator({
        super.key,
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
          StepProcess step = steps[index];

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
                        color: AppColors.primaryColor,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InformationModal(
                                stepProcess : step
                              );
                            },
                          );
                        },
                        isActivated: step.isCompleted,
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