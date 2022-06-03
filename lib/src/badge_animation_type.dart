import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

/// This is a set of animations that you can use for your [Badge] widget.
enum BadgeAnimationType {
  /// This value is for using the slide animation
  ///
  /// See also:
  /// * [SlideTransition]
  slide,

  /// This value is for using the scale animation
  ///
  /// See also:
  /// * [ScaleTransition]
  scale,

  /// This value is for using the fade animation
  ///
  /// See also:
  /// * [FadeTransition]
  fade,
}
