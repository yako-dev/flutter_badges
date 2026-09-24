import 'package:badges/badges.dart';
import 'package:badges/src/badge_gradient_type.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:material_ui/material_ui.dart';

import 'dart:ui' as ui;

class GradientUtils {
  static Shader getGradientShader({
    required BadgeGradient badgeGradient,
    required double width,
    required double height,
  }) {
    final colors = badgeGradient.colors;
    final stops = badgeGradient.stops ?? _evenStops(colors.length);
    final tileMode = badgeGradient.tileMode;
    switch (badgeGradient.gradientType) {
      case BadgeGradientType.linear:
        return ui.Gradient.linear(
          CalculationUtils.calculateOffset(
            alignment: badgeGradient.begin!,
            width: width,
            height: height,
          ),
          CalculationUtils.calculateOffset(
            alignment: badgeGradient.end!,
            width: width,
            height: height,
          ),
          colors,
          stops,
          tileMode,
        );
      case BadgeGradientType.radial:
        return ui.Gradient.radial(
          CalculationUtils.calculateOffset(
            alignment: badgeGradient.center!,
            width: width,
            height: height,
          ),
          width * badgeGradient.radius!,
          colors,
          stops,
          tileMode,
        );
      case BadgeGradientType.sweep:
        return ui.Gradient.sweep(
          CalculationUtils.calculateOffset(
            alignment: badgeGradient.center!,
            width: width,
            height: height,
          ),
          colors,
          stops,
          tileMode,
          badgeGradient.startAngle!,
          badgeGradient.endAngle!,
        );
    }
  }

  /// dart:ui gradients need explicit stops when there are more than two
  /// colors, so spread them evenly like [Gradient.createShader] does.
  static List<double>? _evenStops(int count) {
    if (count <= 2) return null;
    return List<double>.generate(count, (i) => i / (count - 1));
  }
}
