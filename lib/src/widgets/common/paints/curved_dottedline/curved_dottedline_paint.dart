import 'dart:core';
import 'dart:typed_data';
import 'dart:ui';

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
    path = _buildCurvePathIfIsRight(path, size);

    if (isLeft) {
      path = _buildMirrorCurvePath(path, size);
    }

    canvas.drawPath(
        dashPath(path, dashArray: CircularIntervalList([10, 9.5])), paint);
  }

  Path _buildMirrorCurvePath(Path originalPath, Size size) {
    // Find the ending point of the original curve
    PathMetric pathMetric = originalPath.computeMetrics().last;
    Tangent? tangent = pathMetric.getTangentForOffset(pathMetric.length);
    Offset endPoint = tangent!.position;

    // Print x and y coordinates of the end point
    print('endPoint.dx: ${endPoint.dx} endPoint.dy: ${endPoint.dy}');

    // Create a mirrored path by applying a matrix transformation
    Path mirrorPath = Path.from(originalPath);

    final Matrix4 matrix = Matrix4.identity()
      ..translate(0.0, endPoint.dy) // Translate the path down to the x-axis
      ..scale(1.0, -1.0) // Mirror scale on the y-axis
      ..translate(0.0, -endPoint.dy); // Translate the path back up by the same amount

    mirrorPath = mirrorPath.transform(matrix.storage);

    // Translate the entire path down by the y-coordinate of the endpoint to start from the same y-position
    mirrorPath = mirrorPath.shift(const Offset(1, 1));

    return mirrorPath;
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