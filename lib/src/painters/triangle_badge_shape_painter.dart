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
    path
      ..moveTo(width * 0.132, height * 0.888)
      ..arcToPoint(Offset(width * 0.075, height * 0.772),
          radius: Radius.circular(height * 0.09))
      ..lineTo(width * 0.428, height * 0.156)
      ..arcToPoint(Offset(width * 0.582, height * 0.156),
          radius: Radius.circular(height * 0.09))
      ..lineTo(width * 0.928, height * 0.756)
      ..arcToPoint(Offset(width * 0.868, height * 0.888),
          radius: Radius.circular(height * 0.09))
      ..lineTo(width * 0.132, height * 0.888);
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
