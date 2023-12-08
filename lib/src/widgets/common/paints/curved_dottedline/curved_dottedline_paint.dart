import 'dart:core';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CurvedDottedLinePainter extends CustomPainter {
  final bool isLeft;
  final Color color;
  final double strokeWidth;

  CurvedDottedLinePainter({
    required this.isLeft,
    required this.color,
    this.strokeWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Path path = Path();

    if (isLeft) {
      path = _buildCurvePathIfIsLeft(path, size);
    } else {
      path = _buildCurvePathIfIsRight(path, size);
    }

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList([10, 9.5])), paint);
  }

  _buildCurvePathIfIsLeft(Path path, Size size) {
    // Commencez à partir du côté droit au lieu du côté gauche
    path.moveTo(size.width, size.height / 50);

    // Ajoutez la courbe de Bézier cubique en inversant les coordonnées X
    path.cubicTo(
        size.height + (size.height * (1 / 3)), size.width - (size.width * (0.7 / 2)),
      size.width - (size.width * (2 / 3)), size.height - (size.height * (1.497 / 2.044)),
      0, size.height,
    );

    return path;
  }


  _buildCurvePathIfIsRight(Path path, Size size) {
      path.moveTo(20, size.height/50);

      // Add the cubic bezier curve
      path.cubicTo(
        size.width * (0.7 / 2), size.height + (size.height * (1 / 3)),
        size.width * (2 / 3), size.height - (size.height * (1.497 / 2.044)),
        size.width, size.height,
      );

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}