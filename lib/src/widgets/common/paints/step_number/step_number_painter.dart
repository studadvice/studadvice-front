import 'package:flutter/material.dart';

class StepNumberPainter extends CustomPainter {
  final int stepNumber;
  final Color color;
  final double diameter;

  StepNumberPainter({
    required this.stepNumber,
    required this.color,
    required this.diameter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(
      text: stepNumber.toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: diameter * 0.5,
        fontWeight: FontWeight.bold,
      ),
    );

    // define textPainter
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // define offset
    final offset = Offset(
      diameter * 0.5, // center of the canvas
      diameter * 0.5, // center of the canvas
    );
    
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(offset, diameter * 0.5, circlePaint);
    
    textPainter.layout(minWidth: 0, maxWidth: diameter);
    textPainter.paint(canvas, offset - Offset(textPainter.width * 0.5, textPainter.height * 0.5));
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
    
}