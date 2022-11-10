import 'package:badges/src/badge_animation_type.dart';
import 'package:flutter/animation.dart';

class BadgeAnimation {
  /// True to animate badge on [badgeContent] change.
  /// False to disable animation.
  /// Default value is true.
  final bool toAnimate;

  /// Duration of the badge animations when the [badgeContent] changes.
  /// The default value is Duration(milliseconds: 500).
  final Duration animationDuration;

  /// Duration of the badge appearance and disappearance animations.
  /// Set this to zero to skip the badge appearance and disappearance animations
  /// The default value is Duration(milliseconds: 200).
  final Duration appearanceDuration;

  /// Type of the animation for badge
  /// The default value is [BadgeAnimationType.slide].
  final BadgeAnimationType animationType;

  /// Make it true to have infinite animation
  /// False to have animation only when [badgeContent] is changed
  /// The default value is false
  final bool loopAnimation;

  /// Controls curve of the fade animation
  ///
  /// The default value is [Curves.ease]
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  /// * [animationDuration]
  final Curve fadeCurveAnimation;

  /// Controls curve of the slide animation
  ///
  /// The default value is [Curves.ease]
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  /// * [animationDuration]
  final Curve slideCurveAnimation;

  const BadgeAnimation({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationType = BadgeAnimationType.fade,
    this.fadeCurveAnimation = Curves.easeOutCubic,
    this.slideCurveAnimation = Curves.elasticOut,
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
  });
}
