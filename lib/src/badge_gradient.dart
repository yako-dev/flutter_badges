import 'package:badges/src/badge_gradient_type.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BadgeGradient {
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final TileMode tileMode;
  final List<Color> colors;
  final List<double>? stops;
  final GradientTransform? transform;
  final AlignmentGeometry? center;
  final double? radius;
  final AlignmentGeometry? focal;
  final double? focalRadius;
  final double? startAngle;
  final double? endAngle;
  final BadgeGradientType gradientType;

  const BadgeGradient.linear({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.colors,
    this.stops,
    this.tileMode = TileMode.clamp,
    this.transform,
  })  : gradientType = BadgeGradientType.linear,
        center = null,
        radius = null,
        focal = null,
        focalRadius = null,
        startAngle = null,
        endAngle = null;

  const BadgeGradient.radial({
    this.center = Alignment.center,
    required this.colors,
    this.radius = 0.5,
    this.stops,
    this.tileMode = TileMode.clamp,
    this.focal,
    this.focalRadius = 0.0,
    this.transform,
  })  : gradientType = BadgeGradientType.radial,
        begin = null,
        end = null,
        endAngle = null,
        startAngle = null;

  const BadgeGradient.sweep({
    this.tileMode = TileMode.clamp,
    required this.colors,
    this.center = Alignment.center,
    this.startAngle = 0.0,
    this.endAngle = math.pi * 2,
    this.stops,
    this.transform,
  })  : gradientType = BadgeGradientType.sweep,
        begin = null,
        end = null,
        radius = null,
        focal = null,
        focalRadius = null;

  Gradient gradient() {
    switch (gradientType) {
      case BadgeGradientType.linear:
        return LinearGradient(
          colors: colors,
          begin: begin!,
          end: end!,
          stops: stops,
          tileMode: tileMode,
          transform: transform,
        );
      case BadgeGradientType.radial:
        return RadialGradient(
          colors: colors,
          radius: radius!,
          center: center!,
          stops: stops,
          tileMode: tileMode,
          focal: focal,
          focalRadius: focalRadius!,
          transform: transform,
        );
      case BadgeGradientType.sweep:
        return SweepGradient(
          colors: colors,
          center: center!,
          startAngle: startAngle!,
          endAngle: endAngle!,
          stops: stops,
          tileMode: tileMode,
          transform: transform,
        );
    }
  }
}
