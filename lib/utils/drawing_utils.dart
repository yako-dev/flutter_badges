import 'package:badges/badges.dart';
import 'package:badges/painters/cloud_painter.dart';
import 'package:flutter/material.dart';

class DrawingUtils {
  static CustomPainter? drawBadgeShape(
      {required BadgeShape shape, Color? color, Gradient? gradient,}) {
    switch (shape) {
      case BadgeShape.circle:
        break;
      case BadgeShape.sun:
        return SunPainter(color: color, gradient: gradient);
      case BadgeShape.square:
        break;
    }
    return null;
  }
}
