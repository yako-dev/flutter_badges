import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  Color? color;
  Gradient? gradient;

  CloudPainter({
    Key? key,
    this.color = Colors.blue,
    this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final smallRadius = width * 0.133;
    List<Offset> points = [
      Offset(width * 0.5, height * 0.24),
      Offset(width * 0.683, height * 0.32),
      Offset(width * 0.76, height * 0.5),
      Offset(width * 0.673, height * 0.68),
      Offset(width * 0.5, height * 0.76),
      Offset(width * 0.316, height * 0.683),
      Offset(width * 0.24, height * 0.5),
      Offset(width * 0.316, height * 0.316),
    ];
    Paint paint = Paint();
    final startOffset = Offset(width * 0.24, height * 0.5);
    final endOffset = Offset(width * 0.76, height * 0.5);
    final centerOffset = Offset(width * 0.5, height * 0.5);

    if (gradient.runtimeType == LinearGradient) {
      paint.shader = ui.Gradient.linear(
        startOffset,
        endOffset,
        gradient!.colors,
      );
    } else if (gradient.runtimeType == RadialGradient) {
      paint.shader = ui.Gradient.radial(
        centerOffset,
        width * 0.33,
        gradient!.colors,
      );
    } else if (gradient.runtimeType == SweepGradient) {
      paint.shader = ui.Gradient.sweep(
        centerOffset,
        gradient!.colors,
      );
    }
    paint.color = color!.withOpacity(1.0);

    canvas.drawCircle(centerOffset, width * 0.33, paint);
    for (int i = 0; i < points.length; i++) {
      var point = points[i];
      canvas.drawCircle(point, smallRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
