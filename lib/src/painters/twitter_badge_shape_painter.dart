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

    Path path = Path();
    Paint paint = Paint();
    Paint paintBorder = Paint();

    if (badgeGradient != null) {
      paint.shader = GradientUtils.getGradientShader(
        badgeGradient: badgeGradient!,
        width: width,
        height: height,
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
        width: width,
        height: height,
      );
    }

    path.moveTo(width * 0.357, height * 0.156);
    path.arcToPoint(Offset(width * 0.643, height * 0.156),
        radius: Radius.circular(height * 0.157));
    path.arcToPoint(Offset(width * 0.847, height * 0.396),
        radius: Radius.circular(height * 0.165));
    path.arcToPoint(Offset(width * 0.857, height * 0.666),
        radius: Radius.circular(height * 0.170));
    path.arcToPoint(Offset(width * 0.643, height * 0.844),
        radius: Radius.circular(height * 0.163));
    path.arcToPoint(Offset(width * 0.357, height * 0.844),
        radius: Radius.circular(height * 0.157));
    path.arcToPoint(Offset(width * 0.145, height * 0.665),
        radius: Radius.circular(height * 0.163));
    path.arcToPoint(Offset(width * 0.154, height * 0.372),
        radius: Radius.circular(height * 0.170));
    path.arcToPoint(Offset(width * 0.357, height * 0.156),
        radius: Radius.circular(height * 0.163));

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
