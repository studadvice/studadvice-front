import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:get/get.dart';

class StepsIndicator extends StatelessWidget {
  final int currentStep;
  final List<StepItem> steps;
  static double DIAMETER = 75.0;


  StepsIndicator({
        super.key,
        required this.currentStep,
        required this.steps,
  });

  

  @override
  Widget build(BuildContext context) {
    final StepController controller = Get.find<StepController>();

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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const InformationModal(
                                accountInfo: 'Votre compte ants.gouv.fr',
                                domicileInfo: 'Votre justificatif de domicile',
                                photoIdInfo: 'Votre photo ID',
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