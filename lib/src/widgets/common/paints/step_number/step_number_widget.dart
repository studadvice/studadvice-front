import 'package:flutter/material.dart';
import 'package:stud_advice/src/widgets/common/paints/step_number/step_number_painter.dart';

class StepNumberWidget extends StatelessWidget {
  final int stepNumber;
  final double diameter;
  final Color color;
  final bool isActivated;
  final Widget? child;
  final VoidCallback? onPressed;

  const StepNumberWidget({
    super.key,
    required this.stepNumber,
    required this.diameter,
    required this.color,
    this.isActivated = false,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double borderWidth = isActivated ? 2.0 : 1.0;

    return GestureDetector(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              painter: StepNumberPainter(
                stepNumber: stepNumber,
                color: color,
                diameter: diameter,
                borderWidth: borderWidth,
              ),
              size: Size(diameter, diameter),
            ),
            if (child != null)
              Padding(padding: const EdgeInsets.only(left: 0.5), child: child!),
          ],
        ),
      ),
    );
  }
}
