import 'dart:core';
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
    PathMetric pathMetric = originalPath.computeMetrics().last;
    Tangent? tangent = pathMetric.getTangentForOffset(pathMetric.length);
    Offset endPoint = tangent!.position;

    Path mirrorPath = Path.from(originalPath);

    final Matrix4 matrix = Matrix4.identity()
      ..translate(0.0, -endPoint.dy)
      ..scale(1.0, -1.0)
      ..translate(0.0, endPoint.dy);

    mirrorPath = mirrorPath.transform(matrix.storage);

    mirrorPath = mirrorPath.shift(Offset(0, 3 * endPoint.dy));

    return mirrorPath;
  }

  _buildCurvePathIfIsRight(Path path, Size size) {
      path.moveTo(-size.width/20, size.height/20);
      path.cubicTo(
        - size.width/20 + 50, 120 + size.height/20,
        size.width - 50, size.height - 120,
        size.width, size.height,
      );
      return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}