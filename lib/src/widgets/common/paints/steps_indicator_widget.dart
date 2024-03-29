import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_advice/stud_advice.dart';

class StepsIndicator extends StatelessWidget {
  final int currentStep;
  final List<StepItem> steps;
  static double DIAMETER = 90.0;
  final String administrativeProcessId;
  final String categoryId;

  StepsIndicator(
      {super.key,
      required this.currentStep,
      required this.steps,
      required this.administrativeProcessId,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: GetBuilder<StepController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.steps.length,
            padding: const EdgeInsets.only(bottom: 250),
            itemBuilder: (context, index) {
              int stepNumber = index + 1;
              bool isLeftAligned = stepNumber % 2 != 0;
              StepItem step = controller.steps[index];

              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double screenWidth = constraints.maxWidth;
                  double stepWidgetDiameter = DIAMETER;
                  double curveWidth = screenWidth - stepWidgetDiameter - 20;

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: isLeftAligned
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          if (isLeftAligned) const SizedBox(width: 10),
                          StepNumberWidget(
                            isLeftAligned: isLeftAligned,
                            stepNumber: stepNumber,
                            diameter: stepWidgetDiameter,
                            color: step.color ?? Colors.blue,
                            borderColor: step.borderColor ?? Colors.blue,
                            onPressed: () => {
                              if (index <= controller.steps.length - 1)
                                controller.completeStep(index + 1,
                                    administrativeProcessId, categoryId),
                              _onPopupOpened(index, step, context),
                            },
                            isActivated: step.isCompleted!,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: screenWidth - stepWidgetDiameter - 40,
                              ),
                              child: Text(
                                step.name ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          if (!isLeftAligned) const SizedBox(width: 10),
                        ],
                      ),
                      if (index < steps.length - 1)
                        CustomPaint(
                          size: Size(curveWidth, curveWidth / 4),
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
          );
        },
      ),
    );
  }

  void _onPopupOpened(int stepIndex, StepItem step, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InformationModal(
            requiredDocuments: step.requiredDocuments,
            stepDescription: step.description,
            resources: step.resources);
      },
    );
  }
}
