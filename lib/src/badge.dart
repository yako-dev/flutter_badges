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
  double? textSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.badgeContent is Text) {
        final text = widget.badgeContent as Text;
        final size = _textSize(text.data!, text.style);
        setState(() {
          if (size.height > size.width) {
            textSize = (widget.badgeStyle.padding?.vertical ?? 0) + size.height;
          }
        });
      }
    });
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

  Size _textSize(String text, TextStyle? style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return widget.ignorePointer
          ? IgnorePointer(child: _getBadge())
          : GestureDetector(onTap: widget.onTap, child: _getBadge());
    } else {
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
                ? IgnorePointer(child: _getBadge())
                : GestureDetector(onTap: widget.onTap, child: _getBadge()),
          ),
        ],
      );
    }
  }

  double _getOpacity() {
    if (!widget.badgeAnimation.toAnimate) {
      if (!widget.showBadge) {
        return 0.0;
      }
      return 1.0;
    } else if (!widget
        .badgeAnimation.appearanceDisappearanceFadeAnimationEnabled) {
      return 1.0;
    }
    return _appearanceController.value;
  }

  EdgeInsets calculateBadgeContentPadding(
    Widget? badgeContent,
    BadgeShape shape,
  ) {
    final isTextContent = badgeContent is Text;
    final isTriangleShape = shape == BadgeShape.triangle;
    if (isTriangleShape) {
      return const EdgeInsets.symmetric(horizontal: 10.0);
    } else if (isTextContent) {
      return const EdgeInsets.symmetric(horizontal: 8.0);
    } else {
      return const EdgeInsets.symmetric(horizontal: 5.0);
    }
  }

  Widget _getBadge() {
    final border = widget.badgeStyle.shape == BadgeShape.circle
        ? CircleBorder(
            side: widget.badgeStyle.borderGradient == null
                ? widget.badgeStyle.borderSide
                : BorderSide.none)
        : RoundedRectangleBorder(
            side: widget.badgeStyle.borderGradient == null
                ? widget.badgeStyle.borderSide
                : BorderSide.none,
            borderRadius: widget.badgeStyle.borderRadius,
          );
    final isCustomShape = widget.badgeStyle.shape == BadgeShape.twitter ||
        widget.badgeStyle.shape == BadgeShape.instagram ||
        widget.badgeStyle.shape == BadgeShape.triangle;
    final isSquareShape = widget.badgeStyle.shape == BadgeShape.square;

    final gradientBorder = widget.badgeStyle.borderGradient != null
        ? BadgeBorderGradient(
            gradient: widget.badgeStyle.borderGradient!.gradient(),
            width: widget.badgeStyle.borderSide.width,
          )
        : null;

    Widget badgeView() {
      return AnimatedBuilder(
        animation: CurvedAnimation(
            parent: _appearanceController, curve: Curves.linear),
        builder: (context, child) {
          return Opacity(
            opacity: _getOpacity(),
            child: isCustomShape
                ? CustomPaint(
                    painter: DrawingUtils.drawBadgeShape(
                      shape: widget.badgeStyle.shape,
                      color: widget.badgeStyle.badgeColor,
                      badgeGradient: widget.badgeStyle.badgeGradient,
                      borderGradient: widget.badgeStyle.borderGradient,
                      borderSide: widget.badgeStyle.borderSide,
                    ),
                    child: UnconstrainedBox(
                      child: IntrinsicWidth(
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Padding(
                            padding: widget.badgeStyle.padding ??
                                calculateBadgeContentPadding(
                                  widget.badgeContent,
                                  widget.badgeStyle.shape,
                                ),
                            child: Center(
                              child: widget.badgeContent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Material(
                    shape: border,
                    elevation: widget.badgeStyle.elevation,
                    // Without this Colors.transparent will be ignored
                    type: MaterialType.transparency,
                    child: AnimatedContainer(
                      curve: widget.badgeAnimation.colorChangeAnimationCurve,
                      duration: widget.badgeAnimation.toAnimate
                          ? widget.badgeAnimation.colorChangeAnimationDuration
                          : Duration.zero,
                      decoration: widget.badgeStyle.shape == BadgeShape.circle
                          ? BoxDecoration(
                              color: widget.badgeStyle.badgeColor,
                              border: gradientBorder,
                              gradient:
                                  widget.badgeStyle.badgeGradient?.gradient(),
                              shape: BoxShape.circle,
                            )
                          : BoxDecoration(
                              color: widget.badgeStyle.badgeColor,
                              gradient:
                                  widget.badgeStyle.badgeGradient?.gradient(),
                              shape: BoxShape.rectangle,
                              borderRadius: widget.badgeStyle.borderRadius,
                              border: gradientBorder,
                            ),
                      child: UnconstrainedBox(
                        child: IntrinsicWidth(
                          child: AspectRatio(
                            aspectRatio: isSquareShape ? 1.5 : 1.0,
                            child: Padding(
                              padding: widget.badgeStyle.padding ??
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SizedBox(
                                height: isSquareShape ? textSize : null,
                                width: isSquareShape ? textSize : null,
                                child: Center(
                                  child: widget.badgeContent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
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
    if (widget.badgeContent is Text && oldWidget.badgeContent is Text) {
      final newText = widget.badgeContent as Text;
      final oldText = oldWidget.badgeContent as Text;
      final size = _textSize(newText.data!, newText.style);
      if (newText.data != oldText.data) {
        setState(() {
          if (size.height > size.width) {
            textSize = (widget.badgeStyle.padding?.vertical ?? 0) + size.height;
          } else {
            textSize = null;
          }
        });
      }
    }
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
