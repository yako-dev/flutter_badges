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

  /// Used only for changing color animation.
  /// The default value is [Curves.linear]
  final Curve colorChangeAnimationCurve;

  /// Used only for changing color animation.
  /// The default value is [Duration.zero], meaning that
  /// no animation will be applied to color change by default.
  final Duration colorChangeAnimationDuration;

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
    this.colorChangeAnimationCurve = Curves.linear,
    this.colorChangeAnimationDuration = Duration.zero,
  })  : animationType = BadgeAnimationType.slide,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null;

  const BadgeAnimation.fade({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
    this.colorChangeAnimationCurve = Curves.linear,
    this.colorChangeAnimationDuration = Duration.zero,
  })  : animationType = BadgeAnimationType.fade,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null,
        slideTransitionPositionTween = null;

  const BadgeAnimation.size({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.fastOutSlowIn,
    this.sizeTransitionAxis = Axis.horizontal,
    this.sizeTransitionAxisAlignment = 1.0,
    this.colorChangeAnimationCurve = Curves.linear,
    this.colorChangeAnimationDuration = Duration.zero,
  })  : animationType = BadgeAnimationType.size,
        slideTransitionPositionTween = null;

  const BadgeAnimation.rotation({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.elasticOut,
    this.colorChangeAnimationCurve = Curves.linear,
    this.colorChangeAnimationDuration = Duration.zero,
  })  : animationType = BadgeAnimationType.rotation,
        sizeTransitionAxis = null,
        sizeTransitionAxisAlignment = null,
        slideTransitionPositionTween = null;

  const BadgeAnimation.scale({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
    this.colorChangeAnimationCurve = Curves.linear,
    this.colorChangeAnimationDuration = Duration.zero,
  })  : animationType = BadgeAnimationType.scale,
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
