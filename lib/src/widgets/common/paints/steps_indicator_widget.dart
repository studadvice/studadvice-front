import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:get/get.dart';

class StepsIndicator extends StatelessWidget {
  final int currentStep;
  final List<StepItem> steps;
  static double DIAMETER = 100.0;


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
        controller: controller.scrollController,
        itemCount: steps.length,
        itemBuilder: (context, index) {
          int stepNumber = index + 1;
          bool isLeftAligned = stepNumber % 2 != 0;
          StepItem step = steps[index];
          double scale = currentStep == index ? 1.1 : 1.0;

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
                      AnimatedScale(
                        scale: scale,
                        duration: const Duration(milliseconds: 300),
                      child: StepNumberWidget(
                          stepNumber: stepNumber,
                          diameter: stepWidgetDiameter,
                          color: step.color,
                          isEnabled: step.isCompleted,
                          onPressed: () => controller.changeStep(index),
                        ),
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