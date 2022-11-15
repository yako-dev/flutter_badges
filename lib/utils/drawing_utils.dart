import 'package:badges/badges.dart';
import 'package:badges/painters/line_painter.dart';
import 'package:flutter/material.dart';

class DrawingUtils {
  static CustomPainter? drawBadgeShape({
    required BadgeShape shape,
    Color? color,
    Gradient? gradient,
    BorderSide? borderSide,
  }) {
    switch (shape) {
      case BadgeShape.circle:
        break;
      case BadgeShape.sun:
        return LinePainter(
            color: color, gradient: gradient, borderSide: borderSide);
      case BadgeShape.square:
        break;
    }
    return null;
  }
}
