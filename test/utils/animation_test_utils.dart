import 'package:badges/badges.dart';

class AnimationTestUtils {
  static BadgeAnimation getAnimationByType({
    required BadgeAnimationType badgeAnimationType,
    required Duration animationDuration,
    required Duration appearanceDuration,
    bool loopAnimation = false,
    bool toAnimate = true,
    Duration colorChangeDuration = Duration.zero,
  }) {
    switch (badgeAnimationType) {
      case BadgeAnimationType.scale:
        return BadgeAnimation.scale(
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appearanceDuration,
          colorChangeAnimationDuration: colorChangeDuration,
          toAnimate: toAnimate,
          loopAnimation: loopAnimation,
        );
      case BadgeAnimationType.slide:
        return BadgeAnimation.slide(
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appearanceDuration,
          colorChangeAnimationDuration: colorChangeDuration,
          toAnimate: toAnimate,
          loopAnimation: loopAnimation,
        );
      case BadgeAnimationType.size:
        return BadgeAnimation.size(
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appearanceDuration,
          colorChangeAnimationDuration: colorChangeDuration,
          toAnimate: toAnimate,
          loopAnimation: loopAnimation,
        );
      case BadgeAnimationType.fade:
        return BadgeAnimation.fade(
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appearanceDuration,
          colorChangeAnimationDuration: colorChangeDuration,
          toAnimate: toAnimate,
          loopAnimation: loopAnimation,
        );
      case BadgeAnimationType.rotation:
        return BadgeAnimation.rotation(
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appearanceDuration,
          colorChangeAnimationDuration: colorChangeDuration,
          toAnimate: toAnimate,
          loopAnimation: loopAnimation,
        );
    }
  }
}
