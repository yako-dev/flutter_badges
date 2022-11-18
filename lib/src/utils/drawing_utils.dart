import 'package:badges/badges.dart';
import 'package:badges/src/painters/line_painter.dart';
import 'package:flutter/material.dart';

class DrawingUtils {
  static CustomPainter? drawBadgeShape({
    required BadgeShape shape,
    Color? color,
    BadgeGradient? badgeGradient,
    BadgeGradient? borderGradient,
    BorderSide? borderSide,
  }) {
    switch (shape) {
      case BadgeShape.circle:
        break;
      case BadgeShape.sun:
        return LinePainter(
          color: color,
          badgeGradient: badgeGradient,
          borderSide: borderSide,
          borderGradient: borderGradient,
        );
      case BadgeShape.square:
        break;
    }
    return null;
  }
}
