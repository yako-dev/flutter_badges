import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgeStyle {
  /// Allows to set the shape to this [badgeContent].
  /// The default value is [BadgeShape.circle].
  final BadgeShape shape;

  /// Allows to set border radius to this [badgeContent].
  /// The default value is [BorderRadius.zero].
  final BorderRadius borderRadius;

  /// Background color of the badge.
  /// If [gradient] is not null, this property will be ignored.
  final Color badgeColor;

  /// Allows to set border side to this [badgeContent].
  /// The default value is [BorderSide.none].
  final BorderSide borderSide;

  /// The size of the shadow below the badge.
  final double elevation;

  /// Background gradient color of the badge.
  /// Will be used over [badgeColor] if not null.
  final BadgeGradient? badgeGradient;

  /// Background gradient color of the border badge.
  /// Will be used over [borderSide.color] if not null.
  final BadgeGradient? borderGradient;

  /// Specifies padding for [badgeContent].
  /// The default value is EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  const BadgeStyle({
    this.shape = BadgeShape.circle,
    this.borderRadius = BorderRadius.zero,
    this.badgeColor = Colors.red,
    this.borderSide = BorderSide.none,
    this.elevation = 2,
    this.badgeGradient,
    this.borderGradient,
    this.padding = const EdgeInsets.all(5.0),
  });

  /// Returns a copy of this [BadgeStyle] with the given fields replaced.
  BadgeStyle copyWith({
    BadgeShape? shape,
    BorderRadius? borderRadius,
    Color? badgeColor,
    BorderSide? borderSide,
    double? elevation,
    BadgeGradient? badgeGradient,
    BadgeGradient? borderGradient,
    EdgeInsetsGeometry? padding,
  }) {
    return BadgeStyle(
      shape: shape ?? this.shape,
      borderRadius: borderRadius ?? this.borderRadius,
      badgeColor: badgeColor ?? this.badgeColor,
      borderSide: borderSide ?? this.borderSide,
      elevation: elevation ?? this.elevation,
      badgeGradient: badgeGradient ?? this.badgeGradient,
      borderGradient: borderGradient ?? this.borderGradient,
      padding: padding ?? this.padding,
    );
  }
}
