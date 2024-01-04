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
                        color: step.color ?? Colors.blue,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InformationModal(
                                accountInfo: 'Votre compte ants.gouv.fr',
                                domicileInfo: 'Votre justificatif de domicile',
                                photoIdInfo: 'Votre photo ID',
                                bodyContent: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                                    'Sed non risus. Suspendisse lectus tortor, dignissim sit amet, '
                                    'adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. '
                                    'Maecenas ligula massa, varius a, semper congue, euismod non, mi. '
                                    'Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, '
                                    'non fermentum diam nisl sit amet erat.'
                                    'Duis semper. Duis arcu massa, scelerisque vitae, consequat in, '
                                    'pretium a, enim. Pellentesque congue. Ut in risus volutpat libero '
                                    'pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas '
                                    'leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut '
                                    'dui porta imperdiet. Integer venenatis ac nunc ut egestas. '
                                    'Aliquam erat volutpat. Sed at lorem in nunc porta tristique.',
                              );
                            },
                          );
                        },
                        isActivated: step.isCompleted ?? false,
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