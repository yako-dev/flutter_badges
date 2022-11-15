import 'package:badges/src/badge_animation_type.dart';
import 'package:flutter/widgets.dart';

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

  /// Used only for [SizeTransition] animation
  /// The default value is Axis.horizontal
  final Axis? sizeTransitionAxis;

  /// Used only for [SizeTransition] animation
  /// The default value is 1.0
  final double? sizeTransitionAxisAlignment;

  /// Used only for [SlideTransition] animation
  /// The default value is
  /// SlideTween(
  ///   begin: const Offset(-0.5, 0.9),
  ///   end: const Offset(0.0, 0.0),
  /// );
  final SlideTween? slideTransitionPositionTween;

  /// Used only for [ScaleTransition] animation
  /// The default value is
  /// ScaleTween(
  ///   begin: 0.1,
  ///   end: 1,
  /// );
  final ScaleTween? scaleTransitionTween;

  const BadgeAnimation.slide({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.elasticOut,
    this.slideTransitionPositionTween = const SlideTween(
      begin: Offset(-0.5, 0.9),
      end: Offset(0.0, 0.0),
    ),
  })  : animationType = BadgeAnimationType.slide,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null,
        scaleTransitionTween = null;

  const BadgeAnimation.fade({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
  })  : animationType = BadgeAnimationType.fade,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null,
        slideTransitionPositionTween = null,
        scaleTransitionTween = null;

  const BadgeAnimation.size({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.fastOutSlowIn,
    this.sizeTransitionAxis = Axis.horizontal,
    this.sizeTransitionAxisAlignment = 1.0,
  })  : animationType = BadgeAnimationType.size,
        slideTransitionPositionTween = null,
        scaleTransitionTween = null;

  const BadgeAnimation.rotation({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.elasticOut,
  })  : animationType = BadgeAnimationType.rotation,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null,
        slideTransitionPositionTween = null,
        scaleTransitionTween = null;

  const BadgeAnimation.scale({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.scaleTransitionTween = const ScaleTween(begin: 0.1, end: 1),
  })  : animationType = BadgeAnimationType.scale,
        curve = Curves.easeOutCubic,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null,
        slideTransitionPositionTween = null;
}

class SlideTween {
  final Offset? begin;
  final Offset? end;

  const SlideTween({this.begin, this.end});

  Tween<Offset> toTween() {
    return Tween<Offset>(begin: begin, end: end);
  }
}

class ScaleTween {
  final double? begin;
  final double? end;

  const ScaleTween({this.begin, this.end});

  Tween<double> toTween() {
    return Tween<double>(begin: begin, end: end);
  }
}
