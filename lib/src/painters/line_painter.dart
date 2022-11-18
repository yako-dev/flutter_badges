import 'package:badges/src/badge_gradient.dart';
import 'package:badges/src/utils/gradient_utils.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  Color? color;
  BadgeGradient? badgeGradient;
  BadgeGradient? borderGradient;
  BorderSide? borderSide;

  LinePainter({
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

    path.moveTo(width * 0.192, height * 0.369);
    path.quadraticBezierTo(width * 0.192, height * 0.192, width * 0.369,
        height * 0.192); //top left
    path.quadraticBezierTo(
        width * 0.5, height * 0.06, width * 0.631, height * 0.192); //top center
    path.quadraticBezierTo(width * 0.808, height * 0.192, width * 0.808,
        height * 0.369); //top right
    path.quadraticBezierTo(width * 0.94, height * 0.5, width * 0.808,
        height * 0.631); //center right
    path.quadraticBezierTo(width * 0.808, height * 0.808, width * 0.631,
        height * 0.808); //bottom right
    path.quadraticBezierTo(width * 0.5, height * 0.94, width * 0.369,
        height * 0.808); //bottom center
    path.quadraticBezierTo(width * 0.192, height * 0.808, width * 0.192,
        height * 0.631); //bottom left
    path.quadraticBezierTo(width * 0.06, height * 0.5, width * 0.192,
        height * 0.369); //center left

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
