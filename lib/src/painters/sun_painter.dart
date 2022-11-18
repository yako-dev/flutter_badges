import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class SunPainter extends CustomPainter {
  Color? color;
  Gradient? gradient;

  SunPainter({
    Key? key,
    this.color = Colors.blue,
    this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double length = size.width;
    if (size.height < length) {
      length = size.height;
    }
    final smallRadius = length * 0.133;
    List<Offset> points = [
      Offset(length * 0.5, length * 0.24),
      Offset(length * 0.683, length * 0.32),
      Offset(length * 0.76, length * 0.5),
      Offset(length * 0.673, length * 0.68),
      Offset(length * 0.5, length * 0.76),
      Offset(length * 0.316, length * 0.683),
      Offset(length * 0.24, length * 0.5),
      Offset(length * 0.316, length * 0.316),
    ];
    Paint paint = Paint();
    final startOffset = Offset(length * 0.24, length * 0.5);
    final endOffset = Offset(length * 0.76, length * 0.5);
    final centerOffset = Offset(length * 0.5, length * 0.5);

    if (gradient.runtimeType == LinearGradient) {
      paint.shader = ui.Gradient.linear(
        startOffset,
        endOffset,
        gradient!.colors,
      );
    } else if (gradient.runtimeType == RadialGradient) {
      paint.shader = ui.Gradient.radial(
        centerOffset,
        length * 0.33,
        gradient!.colors,
      );
    } else if (gradient.runtimeType == SweepGradient) {
      paint.shader = ui.Gradient.sweep(
        centerOffset,
        gradient!.colors,
      );
    }
    paint.color = color!;

    canvas.drawCircle(centerOffset, length * 0.33, paint);
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
