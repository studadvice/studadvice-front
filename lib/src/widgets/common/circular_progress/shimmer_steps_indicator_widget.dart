import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerStepsIndicator extends StatelessWidget {
  final int currentStep;
  final List<StepItem> steps;
  static double DIAMETER = 90.0;
  final String administrativeProcessId;

  ShimmerStepsIndicator({
        super.key,
        required this.currentStep,
        required this.steps,
        required this.administrativeProcessId,
  });

  @override
  Widget build(BuildContext context) {
    final StepController controller = Get.find<StepController>();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double itemHeight = 200;
    int itemCount = (screenHeight / itemHeight).ceil();

    return Shimmer.fromColors(
      baseColor: AppColors.grey[300]! as Color,
      highlightColor: AppColors.grey[100]! as Color,
      enabled: true,
      child: Container(
        child: GetBuilder<StepController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: itemCount,
                padding: const EdgeInsets.only(bottom: 250),
                itemBuilder: (context, index) {
                  int stepNumber = index + 1;
                  bool isLeftAligned = stepNumber % 2 != 0;
                  return LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      double screenWidth = constraints.maxWidth;
                      double stepWidgetDiameter = DIAMETER;
                      double curveWidth = screenWidth - stepWidgetDiameter - 20;

                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
                              children: [
                                if (isLeftAligned) SizedBox(width: 10),
                                ShimmerStepNumberWidget(
                                  isLeftAligned: isLeftAligned,
                                  stepNumber: stepNumber,
                                  diameter: stepWidgetDiameter,
                                  color: Colors.white,
                                  borderColor: Colors.white,
                                  onPressed: () => {},
                                  isActivated: false,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: screenWidth - stepWidgetDiameter - 40,
                                    ),
                                    child: whiteBlock(400, 20),
                                  ),
                                ),
                                if (!isLeftAligned) const SizedBox(width: 10),
                              ],
                            ),
                          ),
                          if (index < steps.length - 1)
                            CustomPaint(
                              size: Size(curveWidth, curveWidth / 4),
                              painter: ShimmerCurvedDottedLinePainter(
                                color: Colors.white,
                                strokeWidth: 0.0,
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
        ),
      );
  }

  Widget whiteBlock(double width, double height) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

}