import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class StepNumberWidget extends StatelessWidget {
  final int stepNumber;
  final double diameter;
  final Color color;
  final bool isActivated;
  final Color borderColor;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLeftAligned;

  const StepNumberWidget({
    super.key,
    required this.stepNumber,
    required this.diameter,
    required this.color,
    this.isActivated = false,
    this.isLeftAligned = false,
    this.child,
    this.onPressed,
    this.borderColor = const Color(0xFF219EBC),
  });

  @override
  Widget build(BuildContext context) {
    double borderWidth = isActivated ? 2.0 : 1.0;
    Color displayColor = color;

    Widget stepNumberWidget = GestureDetector(
      onTap: isActivated ? onPressed : null,
      child: SizedBox(
        width: diameter,
        height: diameter,
        child: Center(
          child: CustomPaint(
            painter: StepNumberPainter(
              borderColor: borderColor,
              stepNumber: stepNumber,
              color: displayColor,
              diameter: diameter,
              borderWidth: borderWidth,
              isActivated: isActivated,
            ),
            size: Size(diameter, diameter),
          ),
        ),
      ),
    );

    return IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLeftAligned) ...[
            stepNumberWidget,
            const SizedBox(width: 16),
            Expanded(child: child!),
          ] else ...[
            Expanded(child: child!),
            const SizedBox(width: 16),
            stepNumberWidget,
          ],
        ],
      ),
    );
  }
}