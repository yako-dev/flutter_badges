import 'dart:math' as math;

import 'package:badges/badges.dart';
import 'package:badges/src/utils/gradient_utils.dart';
import 'package:flutter/material.dart';

class TriangleBadgeShapePainter extends CustomPainter {
  Color? color;
  BadgeGradient? badgeGradient;
  BadgeGradient? borderGradient;
  BorderSide? borderSide;

  TriangleBadgeShapePainter({
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
    path
      ..moveTo(maxSize * 0.132, maxSize * 0.888)
      ..arcToPoint(Offset(maxSize * 0.075, maxSize * 0.772),
          radius: Radius.circular(maxSize * 0.09))
      ..lineTo(maxSize * 0.428, maxSize * 0.156)
      ..arcToPoint(Offset(maxSize * 0.582, maxSize * 0.156),
          radius: Radius.circular(maxSize * 0.09))
      ..lineTo(maxSize * 0.928, maxSize * 0.756)
      ..arcToPoint(Offset(maxSize * 0.868, maxSize * 0.888),
          radius: Radius.circular(maxSize * 0.09))
      ..lineTo(maxSize * 0.132, maxSize * 0.888);
    path.close();

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
