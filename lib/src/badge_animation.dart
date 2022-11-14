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

  /// Controls curve of the animation
  final Curve curve;

  const BadgeAnimation({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationType = BadgeAnimationType.fade,
    this.curve = Curves.easeOutCubic,
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
  });

  BadgeAnimation.slide({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.elasticOut,
  }) : animationType = BadgeAnimationType.slide;

  BadgeAnimation.fade({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
  }) : animationType = BadgeAnimationType.fade;

  BadgeAnimation.size({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.fastOutSlowIn,
  }) : animationType = BadgeAnimationType.size;

  BadgeAnimation.rotation({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.elasticOut,
  }) : animationType = BadgeAnimationType.rotation;

  BadgeAnimation.scale({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
  })  : animationType = BadgeAnimationType.scale,
        curve = Curves.easeOutCubic;
}
