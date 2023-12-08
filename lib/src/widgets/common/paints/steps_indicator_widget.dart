import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/common/paints/curved_dottedline/curved_dottedline_paint.dart';
import 'package:stud_advice/src/widgets/common/paints/step_number/step_number_widget.dart';

class StepsIndicator extends StatelessWidget {
  final int stepCount;
  const StepsIndicator({super.key, required this.stepCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: stepCount,
        itemBuilder: (context, index) {
          int stepNumber = index + 1;
          bool isLeftAligned = stepNumber % 2 != 0;

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
                      // StepNumberWidget(
                      //   stepNumber: stepNumber,
                      //   diameter: stepWidgetDiameter,
                      //   color: Colors.blueGrey,
                      // ),
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