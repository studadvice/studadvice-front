import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class StepNumberPainter extends CustomPainter {
  final int stepNumber;
  final Color color;
  final double diameter;
  final bool isActivated;
  final double borderWidth;
  final Color textBorderColor;

  StepNumberPainter({
    required this.stepNumber,
    required this.color,
    required this.diameter,
    this.isActivated = false,
    this.borderWidth = 3.0,
    this.textBorderColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Determine the fill color based on activation
    Color fillColor = isActivated ? color : Colors.transparent;
    Color borderColor = isActivated ? Colors.blueGrey : color;

    // Paint properties for the circle border
    final borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth;

    // Paint properties for circle fill
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    // Text style remains the same
    final textStyle = TextStyle(
      fontSize: diameter * 0.7,
      fontWeight: FontWeight.bold,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = textBorderColor,
    );

    // TextSpan, TextPainter, and textOffset
    final textSpan = TextSpan(text: stepNumber.toString(), style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();

    final textOffset = Offset(
      (diameter - textPainter.width) / 2,
      (diameter - textPainter.height) / 2,
    );

    // Drawing the filled circle
    if (isActivated) {
      canvas.drawCircle(Offset(diameter / 2, diameter / 2), diameter / 2, fillPaint);
    }

    // Drawing the circle border
    canvas.drawCircle(Offset(diameter / 2, diameter / 2), diameter / 2 - borderWidth / 2, borderPaint);

    // Painting the text
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
