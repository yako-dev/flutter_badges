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

    path.moveTo(width * 0.14, height * 0.14);
    path.lineTo(width * 0.3, height * 0.14);
    path.lineTo(width * 0.385, 0);
    path.lineTo(width * 0.515, height * 0.08);
    path.lineTo(width * 0.627, height * 0.012);
    path.lineTo(width * 0.7, height * 0.134);
    path.lineTo(width * 0.867, height * 0.134);
    path.lineTo(width * 0.867, height * 0.3);
    path.lineTo(width, height * 0.38);
    path.lineTo(width * 0.922, height * 0.505);
    path.lineTo(width * 0.995, height * 0.629);
    path.lineTo(width * 0.866, height * 0.706);
    path.lineTo(width * 0.866, height * 0.868);
    path.lineTo(width * 0.697, height * 0.868);
    path.lineTo(width * 0.618, height * 0.996);
    path.lineTo(width * 0.5, height * 0.924);
    path.lineTo(width * 0.379, height * 0.996);
    path.lineTo(width * 0.302, height * 0.868);
    path.lineTo(width * 0.14, height * 0.868);
    path.lineTo(width * 0.14, height * 0.702);
    path.lineTo(width * 0.004, height * 0.618);
    path.lineTo(width * 0.08, height * 0.494);
    path.lineTo(width * 0.012, height * 0.379);
    path.lineTo(width * 0.14, height * 0.306);
    path.lineTo(width * 0.14, height * 0.14);

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
