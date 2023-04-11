import 'dart:math' as math;

import 'package:badges/badges.dart';
import 'package:badges/src/utils/gradient_utils.dart';
import 'package:flutter/material.dart';

class InstagramBadgeShapePainter extends CustomPainter {
  Color? color;
  BadgeGradient? badgeGradient;
  BadgeGradient? borderGradient;
  BorderSide? borderSide;

  InstagramBadgeShapePainter({
    Key? key,
    this.color = Colors.blue,
    this.badgeGradient,
    this.borderGradient,
    this.borderSide,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final double maxSize = math.max(width, height);

    canvas.clipRect(Offset.zero & Size(maxSize, maxSize));

    Path path = Path();
    Paint paint = Paint();
    Paint paintBorder = Paint();

    if (badgeGradient != null) {
      paint.shader = GradientUtils.getGradientShader(
        badgeGradient: badgeGradient!,
        width: maxSize,
        height: maxSize,
      );
    }
    paintBorder
      ..color = borderSide?.color ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderSide?.width ?? 0;

    if (borderGradient != null) {
      paintBorder.shader = GradientUtils.getGradientShader(
        badgeGradient: borderGradient!,
        width: maxSize,
        height: maxSize,
      );
    }

    path.moveTo(maxSize * 0.14, maxSize * 0.14);
    path.lineTo(maxSize * 0.3, maxSize * 0.14);
    path.lineTo(maxSize * 0.385, 0);
    path.lineTo(maxSize * 0.515, maxSize * 0.08);
    path.lineTo(maxSize * 0.627, maxSize * 0.012);
    path.lineTo(maxSize * 0.7, maxSize * 0.134);
    path.lineTo(maxSize * 0.867, maxSize * 0.134);
    path.lineTo(maxSize * 0.867, maxSize * 0.3);
    path.lineTo(maxSize, maxSize * 0.38);
    path.lineTo(maxSize * 0.922, maxSize * 0.505);
    path.lineTo(maxSize * 0.995, maxSize * 0.629);
    path.lineTo(maxSize * 0.866, maxSize * 0.706);
    path.lineTo(maxSize * 0.866, maxSize * 0.868);
    path.lineTo(maxSize * 0.697, maxSize * 0.868);
    path.lineTo(maxSize * 0.618, maxSize * 0.996);
    path.lineTo(maxSize * 0.5, maxSize * 0.924);
    path.lineTo(maxSize * 0.379, maxSize * 0.996);
    path.lineTo(maxSize * 0.302, maxSize * 0.868);
    path.lineTo(maxSize * 0.14, maxSize * 0.868);
    path.lineTo(maxSize * 0.14, maxSize * 0.702);
    path.lineTo(maxSize * 0.004, maxSize * 0.618);
    path.lineTo(maxSize * 0.08, maxSize * 0.494);
    path.lineTo(maxSize * 0.012, maxSize * 0.379);
    path.lineTo(maxSize * 0.14, maxSize * 0.306);
    path.lineTo(maxSize * 0.14, maxSize * 0.14);

    paint.color = color!;
    canvas.drawPath(path, paint);
    if (borderSide != BorderSide.none) {
      canvas.drawPath(path, paintBorder);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
