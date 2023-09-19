import 'package:badges/badges.dart';
import 'package:badges/src/badge_border_gradient.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:badges/src/utils/drawing_utils.dart';
import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  const Badge({
    Key? key,
    this.badgeContent,
    this.child,
    this.badgeStyle = const BadgeStyle(),
    this.badgeAnimation = const BadgeAnimation.slide(),
    this.position,
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

class BadgeState extends State<Badge> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _appearanceController;
  late Animation<double> _animation;
  bool enableLoopAnimation = false;
  final badgeKey = GlobalKey();
  final animatedBuilderKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    enableLoopAnimation =
        widget.badgeAnimation.animationDuration.inMilliseconds > 0;
    _animationController = AnimationController(
      duration: widget.badgeAnimation.animationDuration,
      reverseDuration: widget.badgeAnimation.animationDuration,
      vsync: this,
    );
    _appearanceController = AnimationController(
      duration: widget.badgeAnimation.disappearanceFadeAnimationDuration,
      reverseDuration: widget.badgeAnimation.disappearanceFadeAnimationDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.badgeAnimation.curve,
    );

    if (widget.showBadge && widget.badgeAnimation.toAnimate) {
      _animationController.forward();
      _appearanceController.forward();

      if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
        _animationController.repeat(
          period: _animationController.duration,
          reverse: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use a parent builder to avoid unnecessary rebuilds.
    return _ParentBuilderWidget(
      parentBuilder: (context, child) {
        if (widget.child == null && widget.ignorePointer) {
          return IgnorePointer(
            child: child,
          );
        }

        if (widget.child == null) {
          return GestureDetector(
            onTap: widget.onTap,
            child: child,
          );
        }

        return Stack(
          fit: widget.stackFit,
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
                  ? IgnorePointer(child: child)
                  : GestureDetector(onTap: widget.onTap, child: child),
            ),
          ],
        );
      },
      childBuilder: (BuildContext context) {
        return _BadgeBuilder(
          key: badgeKey,
          animatedBuilderKey: animatedBuilderKey,
          badgeStyle: widget.badgeStyle,
          showBadge: widget.showBadge,
          badgeAnimation: widget.badgeAnimation,
          animation: _animation,
          badgeContent: widget.badgeContent,
          appearanceController: _appearanceController,
        );
      },
    );
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.badgeAnimation.toAnimate) {
      if (widget.badgeStyle.badgeColor != oldWidget.badgeStyle.badgeColor &&
          widget.showBadge) {
        _animationController.reset();
        _animationController.forward();
      }

      if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
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
        if (newText.data != oldText.data &&
            widget.showBadge &&
            widget.badgeAnimation.toAnimate) {
          _animationController.reset();
          _animationController.forward();
          if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
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
        if (newIcon.icon != oldIcon.icon && widget.showBadge) {
          _animationController.reset();
          _animationController.forward();
          if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
            _animationController.repeat(
              period: _animationController.duration,
              reverse: true,
            );
          }
        }
      }
      if (widget.badgeAnimation.loopAnimation &&
          !oldWidget.badgeAnimation.loopAnimation &&
          enableLoopAnimation) {
        _animationController.repeat(
          period: _animationController.duration,
          reverse: true,
        );
      }
      if (!widget.badgeAnimation.loopAnimation &&
          oldWidget.badgeAnimation.loopAnimation &&
          enableLoopAnimation) {
        _animationController.forward();
      }
      if (widget.showBadge && !oldWidget.showBadge) {
        _animationController.forward();
        _appearanceController.forward();
      } else if (!widget.showBadge && oldWidget.showBadge) {
        _animationController.reverse();
        _appearanceController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _appearanceController.dispose();
    super.dispose();
  }
}

class _BadgeBuilder extends StatelessWidget {
  const _BadgeBuilder({
    required Key key,
    required this.badgeStyle,
    required this.showBadge,
    required this.badgeAnimation,
    required this.animation,
    required this.badgeContent,
    required this.appearanceController,
    required this.animatedBuilderKey,
  }) : super(key: key);

  final Key animatedBuilderKey;
  final BadgeStyle badgeStyle;
  final bool showBadge;
  final BadgeAnimation badgeAnimation;
  final Animation<double> animation;
  final Widget? badgeContent;
  final AnimationController appearanceController;

  double _getOpacity() {
    if (!badgeAnimation.toAnimate) {
      if (!showBadge) {
        return 0.0;
      }
      return 1.0;
    } else if (!badgeAnimation.appearanceDisappearanceFadeAnimationEnabled) {
      return 1.0;
    }
    return appearanceController.value;
  }

  @override
  Widget build(BuildContext context) {
    return _ParentBuilderWidget(parentBuilder: (context, child) {
      if (!badgeAnimation.toAnimate) {
        return child;
      }

      if (badgeAnimation.animationType == BadgeAnimationType.slide) {
        return SlideTransition(
          position: badgeAnimation.slideTransitionPositionTween!
              .toTween()
              .animate(animation),
          child: child,
        );
      }

      if (badgeAnimation.animationType == BadgeAnimationType.scale) {
        ScaleTransition(scale: animation, child: child);
      }

      if (badgeAnimation.animationType == BadgeAnimationType.fade) {
        return FadeTransition(opacity: animation, child: child);
      }

      if (badgeAnimation.animationType == BadgeAnimationType.size) {
        return SizeTransition(
          sizeFactor: animation,
          axis: badgeAnimation.sizeTransitionAxis ?? Axis.horizontal,
          axisAlignment: badgeAnimation.sizeTransitionAxisAlignment ?? 1.0,
          child: child,
        );
      }

      if (badgeAnimation.animationType == BadgeAnimationType.rotation) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      }

      return child;
    }, childBuilder: (BuildContext context) {
      return AnimatedBuilder(
        key: animatedBuilderKey,
        animation:
            CurvedAnimation(parent: appearanceController, curve: Curves.linear),
        builder: (context, child) {
          final opacity = _getOpacity();

          final border = badgeStyle.shape == BadgeShape.circle
              ? CircleBorder(
                  side: badgeStyle.borderGradient == null
                      ? badgeStyle.borderSide
                      : BorderSide.none)
              : RoundedRectangleBorder(
                  side: badgeStyle.borderGradient == null
                      ? badgeStyle.borderSide
                      : BorderSide.none,
                  borderRadius: badgeStyle.borderRadius,
                );
          final isCustomShape = badgeStyle.shape == BadgeShape.twitter ||
              badgeStyle.shape == BadgeShape.instagram;

          final gradientBorder = badgeStyle.borderGradient != null
              ? BadgeBorderGradient(
                  gradient: badgeStyle.borderGradient!.gradient(),
                  width: badgeStyle.borderSide.width,
                )
              : null;

          return Opacity(
            opacity: opacity,
            child: isCustomShape
                ? CustomPaint(
                    painter: DrawingUtils.drawBadgeShape(
                      shape: badgeStyle.shape,
                      color: badgeStyle.badgeColor,
                      badgeGradient: badgeStyle.badgeGradient,
                      borderGradient: badgeStyle.borderGradient,
                      borderSide: badgeStyle.borderSide,
                    ),
                    child: Padding(
                      padding: badgeStyle.padding,
                      child: badgeContent,
                    ),
                  )
                : Material(
                    shape: border,
                    elevation: badgeStyle.elevation,
                    // Without this Colors.transparent will be ignored
                    type: MaterialType.transparency,
                    child: AnimatedContainer(
                      curve: badgeAnimation.colorChangeAnimationCurve,
                      duration: badgeAnimation.toAnimate
                          ? badgeAnimation.colorChangeAnimationDuration
                          : Duration.zero,
                      decoration: badgeStyle.shape == BadgeShape.circle
                          ? BoxDecoration(
                              color: badgeStyle.badgeColor,
                              border: gradientBorder,
                              gradient: badgeStyle.badgeGradient?.gradient(),
                              shape: BoxShape.circle,
                            )
                          : BoxDecoration(
                              color: badgeStyle.badgeColor,
                              gradient: badgeStyle.badgeGradient?.gradient(),
                              shape: BoxShape.rectangle,
                              borderRadius: badgeStyle.borderRadius,
                              border: gradientBorder,
                            ),
                      child: Padding(
                        padding: badgeStyle.padding,
                        child: badgeContent,
                      ),
                    ),
                  ),
          );
        },
      );
    });
  }
}

class _ParentBuilderWidget extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    Widget child,
  ) parentBuilder;
  final WidgetBuilder childBuilder;

  const _ParentBuilderWidget({
    Key? key,
    required this.parentBuilder,
    required this.childBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => parentBuilder(
        context,
        childBuilder(context),
      );
}
