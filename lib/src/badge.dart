import 'package:badges/badges.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:badges/utils/drawing_utils.dart';
import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  const Badge({
    Key? key,
    this.badgeContent,
    this.child,
    this.badgeStyle = const BadgeStyle(),
    this.badgeAnimation = const BadgeAnimation.slide(),
    this.position,
    this.alignment = Alignment.center,
    this.showBadge = true,
    this.ignorePointer = false,
    this.stackFit = StackFit.loose,
    this.onTap,
  }) : super(key: key);

  /// The badge child, e.g. cart icon button.
  final Widget? child;

  /// Contains all badge style properties.
  final BadgeStyle badgeStyle;

  /// Contains all badge animation properties.
  final BadgeAnimation badgeAnimation;

  /// Defines alignment for your [child].
  /// The default value is [Alignment.center].
  final AlignmentGeometry alignment;

  /// Allows to set custom position of badge according to [child].
  /// If [child] is null, it doesn't make sense to use it.
  final BadgePosition? position;

  /// Content inside badge.
  final Widget? badgeContent;

  /// Can make your [badgeContent] interactive.
  /// The default value is false.
  /// Make it true to make badge intercept all taps
  /// Make it false and all taps will be passed through the badge
  final bool ignorePointer;

  /// Allows to edit fit parameter to [Stack] widget.
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows you to hide or show entire badge.
  /// The default value is true.
  final bool showBadge;

  /// Will be called when you tap on the badge
  /// Important: if the badge is outside of the child
  /// the additional padding will be applied to make the full badge clickable
  final Function()? onTap;

  @override
  BadgeState createState() => BadgeState();
}

class BadgeState extends State<Badge> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.badgeAnimation.animationDuration,
      reverseDuration: widget.badgeAnimation.animationDuration,
      vsync: this,
    );

    if (widget.badgeAnimation.animationType == BadgeAnimationType.scale) {
      _animation = widget.badgeAnimation.scaleTransitionTween!
          .toTween()
          .animate(_animationController);
    } else {
      _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.badgeAnimation.curve,
      );
    }

    _animationController.forward();

    if (widget.badgeAnimation.loopAnimation) {
      _animationController.repeat(
        period: _animationController.duration,
        reverse: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return GestureDetector(
        onTap: widget.onTap,
        child: _getBadge(),
      );
    } else {
      return Stack(
        fit: widget.stackFit,
        alignment: widget.alignment,
        clipBehavior: Clip.none,
        children: [
          /// When the onTap is specified, we need to add some padding
          /// to make the full badge tappable.
          widget.onTap == null
              ? widget.child!
              : Padding(
                  padding: CalculationUtils.calculatePadding(widget.position),
                  child: widget.child!,
                ),
          BadgePositioned(
            /// When the onTap is specified the additional padding is added
            /// Thats why we need to recalculate the position
            position: widget.onTap == null
                ? widget.position
                : CalculationUtils.calculatePosition(widget.position),
            child: widget.ignorePointer
                ? IgnorePointer(child: _getBadge())
                : GestureDetector(onTap: widget.onTap, child: _getBadge()),
          ),
        ],
      );
    }
  }

  Widget _getBadge() {
    final border = widget.badgeStyle.shape == BadgeShape.circle
        ? CircleBorder(side: widget.badgeStyle.borderSide)
        : RoundedRectangleBorder(
            side: widget.badgeStyle.borderSide,
            borderRadius: widget.badgeStyle.borderRadius,
          );

    Widget badgeView() {
      return AnimatedOpacity(
        opacity: widget.showBadge ? 1 : 0,
        duration: widget.badgeAnimation.appearanceDuration,
        child: widget.badgeStyle.shape == BadgeShape.sun
            ? CustomPaint(
                painter: DrawingUtils.drawBadgeShape(
                  shape: widget.badgeStyle.shape,
                  color: widget.badgeStyle.badgeColor,
                  gradient: widget.badgeStyle.gradient,
                  borderSide: widget.badgeStyle.borderSide,
                ),
                child: Padding(
                  padding: widget.badgeStyle.padding,
                  child: widget.badgeContent,
                ),
              )
            : Material(
                shape: border,
                elevation: widget.badgeStyle.elevation,
                color: widget.badgeStyle.badgeColor,
                child: AnimatedContainer(
                  curve: widget.badgeAnimation.colorChangeAnimationCurve,
                  duration: widget.badgeAnimation.colorChangeAnimationDuration,
                  decoration: widget.badgeStyle.shape == BadgeShape.circle
                      ? BoxDecoration(
                          gradient: widget.badgeStyle.gradient,
                          shape: BoxShape.circle,
                        )
                      : BoxDecoration(
                          gradient: widget.badgeStyle.gradient,
                          shape: BoxShape.rectangle,
                          borderRadius: widget.badgeStyle.borderRadius,
                        ),
                  child: Padding(
                    padding: widget.badgeStyle.padding,
                    child: widget.badgeContent,
                  ),
                ),
              ),
      );
    }

    if (widget.badgeAnimation.toAnimate) {
      if (widget.badgeAnimation.animationType == BadgeAnimationType.slide) {
        return SlideTransition(
            position: widget.badgeAnimation.slideTransitionPositionTween!
                .toTween()
                .animate(_animation),
            child: badgeView());
      } else if (widget.badgeAnimation.animationType ==
          BadgeAnimationType.scale) {
        return ScaleTransition(scale: _animation, child: badgeView());
      } else if (widget.badgeAnimation.animationType ==
          BadgeAnimationType.fade) {
        return FadeTransition(opacity: _animation, child: badgeView());
      } else if (widget.badgeAnimation.animationType ==
          BadgeAnimationType.size) {
        return SizeTransition(
          sizeFactor: _animation,
          axis: widget.badgeAnimation.sizeTransitionAxis ?? Axis.horizontal,
          axisAlignment:
              widget.badgeAnimation.sizeTransitionAxisAlignment ?? 1.0,
          child: badgeView(),
        );
      } else if (widget.badgeAnimation.animationType ==
          BadgeAnimationType.rotation) {
        return RotationTransition(
          turns: _animation,
          child: badgeView(),
        );
      }
    }

    return badgeView();
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.badgeStyle.badgeColor != oldWidget.badgeStyle.badgeColor) {
    //   _animationController.reset();
    //   _animationController.forward();
    // }

    if (widget.badgeAnimation.loopAnimation) {
      if (_animationController.isAnimating) return;
      _animationController.repeat(
        period: _animationController.duration,
        reverse: true,
      );
      return;
    }
    if (widget.badgeContent is Text && oldWidget.badgeContent is Text) {
      final newText = widget.badgeContent as Text;
      final oldText = oldWidget.badgeContent as Text;
      if (newText.data != oldText.data) {
        _animationController.reset();
        _animationController.forward();
        if (widget.badgeAnimation.loopAnimation) {
          _animationController.repeat(
            period: _animationController.duration,
            reverse: true,
          );
        }
      }
    }

    if (widget.badgeContent is Icon && oldWidget.badgeContent is Icon) {
      final newIcon = widget.badgeContent as Icon;
      final oldIcon = oldWidget.badgeContent as Icon;
      if (newIcon.icon != oldIcon.icon) {
        _animationController.reset();
        _animationController.forward();
        if (widget.badgeAnimation.loopAnimation) {
          _animationController.repeat(
            period: _animationController.duration,
            reverse: true,
          );
        }
      }
    }
    if (widget.badgeAnimation.loopAnimation &&
        !oldWidget.badgeAnimation.loopAnimation) {
      _animationController.repeat(
        period: _animationController.duration,
        reverse: true,
      );
    }
    if (!widget.badgeAnimation.loopAnimation &&
        oldWidget.badgeAnimation.loopAnimation) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
