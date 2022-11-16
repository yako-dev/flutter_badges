import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  Color? color;
  Gradient? gradient;
  BorderSide? borderSide;

  LinePainter({
    Key? key,
    this.color = Colors.blue,
    this.gradient,
    this.borderSide,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    Paint paint = Paint();
    Paint paintBorder = Paint();

    paintBorder
      ..color = borderSide?.color ?? Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = borderSide?.width ?? 0;

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