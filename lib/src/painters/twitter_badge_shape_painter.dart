import 'dart:math' as math;

import 'package:badges/src/badge_gradient.dart';
import 'package:badges/src/utils/gradient_utils.dart';
import 'package:flutter/material.dart';

class TwitterBadgeShapePainter extends CustomPainter {
  Color? color;
  BadgeGradient? badgeGradient;
  BadgeGradient? borderGradient;
  BorderSide? borderSide;

  TwitterBadgeShapePainter({
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

    path.moveTo(maxSize * 0.357, maxSize * 0.156);
    path.arcToPoint(Offset(maxSize * 0.643, maxSize * 0.156),
        radius: Radius.circular(maxSize * 0.157));
    path.arcToPoint(Offset(maxSize * 0.847, maxSize * 0.396),
        radius: Radius.circular(maxSize * 0.165));
    path.arcToPoint(Offset(maxSize * 0.857, maxSize * 0.666),
        radius: Radius.circular(maxSize * 0.170));
    path.arcToPoint(Offset(maxSize * 0.643, maxSize * 0.844),
        radius: Radius.circular(maxSize * 0.163));
    path.arcToPoint(Offset(maxSize * 0.357, maxSize * 0.844),
        radius: Radius.circular(maxSize * 0.157));
    path.arcToPoint(Offset(maxSize * 0.145, maxSize * 0.665),
        radius: Radius.circular(maxSize * 0.163));
    path.arcToPoint(Offset(maxSize * 0.154, maxSize * 0.372),
        radius: Radius.circular(maxSize * 0.170));
    path.arcToPoint(Offset(maxSize * 0.357, maxSize * 0.156),
        radius: Radius.circular(maxSize * 0.163));

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
