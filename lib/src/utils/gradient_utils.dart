import 'package:badges/badges.dart';
import 'package:badges/src/badge_gradient_type.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientUtils {
  static Shader getGradientShader({
    required BadgeGradient badgeGradient,
    required double width,
    required double height,
  }) {
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
          badgeGradient.colors,
        );
      case BadgeGradientType.radial:
        return ui.Gradient.radial(
          CalculationUtils.calculateOffset(
            alignment: badgeGradient.center!,
            width: width,
            height: height,
          ),
          width * badgeGradient.radius!,
          badgeGradient.colors,
        );
      case BadgeGradientType.sweep:
        return ui.Gradient.sweep(
          CalculationUtils.calculateOffset(
            alignment: badgeGradient.center!,
            width: width,
            height: height,
          ),
          badgeGradient.colors,
        );
    }
  }
}
