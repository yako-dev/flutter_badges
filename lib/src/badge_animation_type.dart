import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

/// This is a set of animations that you can use for your [Badge] widget.
/// Do not use them explicitly, use for example [BadgeAnimation.slide()] instead.
enum BadgeAnimationType {
  /// See also:
  /// * [SlideTransition]
  slide,

  /// See also:
  /// * [ScaleTransition]
  scale,

  /// See also:
  /// * [FadeTransition]
  fade,

  /// See also:
  /// * [SizeTransition]
  size,

  /// See also:
  /// * [RotationTransition]
  rotation
}
