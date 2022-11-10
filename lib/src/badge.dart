import 'package:badges/badges.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:flutter/material.dart';

/// This widget allows you to add badges to any [Widget].
class Badge extends StatefulWidget {
  /// Creates a [Badge].
  ///
  /// If [child] is null, it doesn't make sense to set [ignorePointer],
  /// [position] and [alignment]
  ///
  /// See also:
  ///
  /// * [BadgeShape]
  /// * [BorderRadius]
  /// * [BadgeAnimationType]
  /// * [BorderSide]
  const Badge({
    Key? key,
    this.badgeContent,
    this.child,
    this.badgeStyle = const BadgeStyle(),
    this.toAnimate = true,
    this.position, //
    this.animationDuration = const Duration(milliseconds: 500),
    this.alignment = Alignment.center,
    this.animationType = BadgeAnimationType.fade,
    this.showBadge = true,
    this.ignorePointer = false,
    this.stackFit = StackFit.loose,
    this.onTap,
    this.fadeCurveAnimation = Curves.easeOutCubic,
    this.slideCurveAnimation = Curves.elasticOut,
    this.loopAnimation = false,
    this.appearanceDuration = const Duration(milliseconds: 200),
  }) : super(key: key);

  /// The badge child, e.g. cart icon button.
  final Widget? child;

  final BadgeStyle badgeStyle;

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

  /// Allows to edit fit parameter to [Stack] widget.
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows you to hide or show entire badge.
  /// The default value is true.
  final bool showBadge;

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

  final Function()? onTap;

  @override
  BadgeState createState() {
    return BadgeState();
  }
}

class BadgeState extends State<Badge> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final Tween<Offset> _positionTween = Tween(
    begin: const Offset(-0.5, 0.9),
    end: const Offset(0.0, 0.0),
  );
  final Tween<double> _scaleTween = Tween<double>(begin: 0.1, end: 1);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      reverseDuration: widget.animationDuration,
      vsync: this,
    );

    if (widget.animationType == BadgeAnimationType.slide) {
      _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.slideCurveAnimation,
      );
    } else if (widget.animationType == BadgeAnimationType.scale) {
      _animation = _scaleTween.animate(_animationController);
    } else if (widget.animationType == BadgeAnimationType.fade) {
      _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.fadeCurveAnimation,
      );
    }

    _animationController.forward();

    if (widget.loopAnimation) {
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
        duration: widget.appearanceDuration,
        child: Material(
          shape: border,
          elevation: widget.badgeStyle.elevation,
          color: widget.badgeStyle.badgeColor,
          child: Padding(
            padding: widget.badgeStyle.padding,
            child: widget.badgeContent,
          ),
        ),
      );
    }

    Widget badgeViewGradient() {
      return AnimatedOpacity(
        opacity: widget.showBadge ? 1 : 0,
        duration: widget.appearanceDuration,
        child: Material(
          shape: border,
          elevation: widget.badgeStyle.elevation,
          child: Container(
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

    if (widget.toAnimate) {
      if (widget.animationType == BadgeAnimationType.slide) {
        return SlideTransition(
          position: _positionTween.animate(_animation),
          child: widget.badgeStyle.gradient == null
              ? badgeView()
              : badgeViewGradient(),
        );
      } else if (widget.animationType == BadgeAnimationType.scale) {
        return ScaleTransition(
          scale: _animation,
          child: widget.badgeStyle.gradient == null
              ? badgeView()
              : badgeViewGradient(),
        );
      } else if (widget.animationType == BadgeAnimationType.fade) {
        return FadeTransition(
          opacity: _animation,
          child: widget.badgeStyle.gradient == null
              ? badgeView()
              : badgeViewGradient(),
        );
      }
    }

    return widget.badgeStyle.gradient == null
        ? badgeView()
        : badgeViewGradient();
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.loopAnimation) {
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
        if (widget.loopAnimation) {
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
        if (widget.loopAnimation) {
          _animationController.repeat(
            period: _animationController.duration,
            reverse: true,
          );
        }
      }
    }
    if (widget.loopAnimation && !oldWidget.loopAnimation) {
      _animationController.repeat(
        period: _animationController.duration,
        reverse: true,
      );
    }
    if (!widget.loopAnimation && oldWidget.loopAnimation) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
