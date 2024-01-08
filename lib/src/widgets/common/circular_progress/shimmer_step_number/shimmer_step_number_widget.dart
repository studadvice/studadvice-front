import 'package:flutter/material.dart';
import 'package:stud_advice/stud_advice.dart';

class ShimmerStepNumberWidget extends StatelessWidget {
  final int stepNumber;
  final double diameter;
  final Color color;
  final bool isActivated;
  final Color borderColor;
  final Widget? child;
  final VoidCallback? onPressed;
  final bool isLeftAligned;

  const ShimmerStepNumberWidget({
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

    Widget shimmerStepNumberWidget = GestureDetector(
      onTap: null,
      child: SizedBox(
        width: diameter,
        height: diameter,
        child: Center(
          child: CustomPaint(
            painter: ShimmerStepNumberPainter(
              borderColor: borderColor,
              stepNumber: stepNumber,
              color: displayColor,
              diameter: diameter,
              borderWidth: borderWidth,
              isActivated: false,
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
            shimmerStepNumberWidget,
            const SizedBox(width: 16),
            Expanded(child: child!),
          ] else ...[
            Expanded(child: child!),
            const SizedBox(width: 16),
            shimmerStepNumberWidget,
          ],
        ],
      ),
    );
  }
}