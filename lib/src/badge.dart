import 'package:badges/src/badge_animation_type.dart';
import 'package:badges/src/badge_position.dart';
import 'package:badges/src/badge_positioned.dart';
import 'package:badges/src/badge_shape.dart';
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
  Badge({
    Key? key,
    Widget? badgeContent,
    Widget? child,
    Color badgeColor = Colors.red,
    double elevation = 2,
    bool toAnimate = true,
    BadgePosition? position,
    BadgeShape shape = BadgeShape.circle,
    EdgeInsetsGeometry padding = const EdgeInsets.all(5.0),
    Duration animationDuration = const Duration(milliseconds: 500),
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    AlignmentGeometry alignment = Alignment.center,
    BadgeAnimationType animationType = BadgeAnimationType.fade,
    bool showBadge = true,
    bool ignorePointer = false,
    BorderSide borderSide = BorderSide.none,
    StackFit stackFit = StackFit.loose,
    Gradient? gradient,
    dynamic Function()? onTap,
    Curve fadeCurveAnimation = Curves.ease,
    Curve slideCurveAnimation = Curves.elasticOut,
  }) : this._(
          child: child,
          badgeColor: badgeColor,
          badgeContent: badgeContent,
          elevation: elevation,
          toAnimate: toAnimate,
          position: position,
          shape: shape,
          padding: padding,
          animationDuration: animationDuration,
          borderRadius: borderRadius,
          alignment: alignment,
          animationType: animationType,
          showBadge: showBadge,
          ignorePointer: ignorePointer,
          borderSide: borderSide,
          stackFit: stackFit,
          gradient: gradient,
          onTap: onTap,
          loopAnimation: false,
          fadeCurveAnimation: fadeCurveAnimation,
          slideCurveAnimation: slideCurveAnimation,
        );

  Badge._({
    Key? key,
    this.badgeContent,
    this.child,
    required this.badgeColor,
    required this.elevation,
    required this.toAnimate,
    this.position,
    required this.shape,
    required this.padding,
    required this.animationDuration,
    required this.borderRadius,
    required this.alignment,
    required this.animationType,
    required this.showBadge,
    required this.ignorePointer,
    required this.borderSide,
    required this.stackFit,
    this.gradient,
    this.onTap,
    required this.loopAnimation,
    required this.fadeCurveAnimation,
    required this.slideCurveAnimation,
  }) : super(key: key);

  factory Badge.looped({
    Widget? badgeContent,
    Widget? child,
    Color badgeColor = Colors.red,
    double elevation = 2,
    bool toAnimate = true,
    BadgePosition? position,
    BadgeShape shape = BadgeShape.circle,
    EdgeInsetsGeometry padding = const EdgeInsets.all(5.0),
    Duration animationDuration = const Duration(milliseconds: 500),
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    AlignmentGeometry alignment = Alignment.center,
    BadgeAnimationType animationType = BadgeAnimationType.fade,
    bool showBadge = true,
    bool ignorePointer = false,
    BorderSide borderSide = BorderSide.none,
    StackFit stackFit = StackFit.loose,
    Gradient? gradient,
    dynamic Function()? onTap,
    Curve fadeCurveAnimation = Curves.ease,
    Curve slideCurveAnimation = Curves.elasticOut,
  }) {
    return Badge._(
      child: child,
      badgeColor: badgeColor,
      badgeContent: badgeContent,
      elevation: elevation,
      toAnimate: toAnimate,
      position: position,
      shape: shape,
      padding: padding,
      animationDuration: animationDuration,
      borderRadius: borderRadius,
      alignment: alignment,
      animationType: animationType,
      showBadge: showBadge,
      ignorePointer: ignorePointer,
      borderSide: borderSide,
      stackFit: stackFit,
      gradient: gradient,
      onTap: onTap,
      loopAnimation: toAnimate,
      fadeCurveAnimation: fadeCurveAnimation,
      slideCurveAnimation: slideCurveAnimation,
    );
  }

  /// Widget that will be wrapped by this [badgeContent].
  final Widget? child;

  /// Defines alignment for your [child].
  ///
  /// The default value is [Alignment.center].
  final AlignmentGeometry alignment;

  /// Allows to set custom position of [badgeContent].
  /// according to [child].
  ///
  /// If [child] is null, it doesn't make sense to use it.
  final BadgePosition? position;

  /// Content of this badge widget
  final Widget? badgeContent;

  /// Can make your [badgeContent] interactive.
  ///
  /// The default value is false.
  final bool ignorePointer;

  /// Background color of the badge.
  /// If [gradient] is not null, this property will be ignored.
  final Color badgeColor;

  /// Background gradient color of the badge.
  /// Will be used over [badgeColor] if not null.
  final Gradient? gradient;

  /// Сontrols the size of the shadow below the material and the opacity
  /// of the elevation overlay color if it is applied.
  final double elevation;

  /// Сontrols animation status.
  ///
  /// The default value is true.
  /// If true, the animation is allowed, if false, the animation is forbidden.
  ///
  /// See also:
  ///
  /// * [animationDuration]
  /// * [animationType]
  final bool toAnimate;

  /// Сontrols the duration of the animation.
  ///
  /// The default value is Duration(milliseconds: 500).
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  final Duration animationDuration;

  /// Controls the type of the animation.
  ///
  /// The default value is [BadgeAnimationType.slide].
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationDuration]
  final BadgeAnimationType animationType;

  /// Allows to set the shape to this [badgeContent].
  ///
  /// The default value is [BadgeShape.circle].
  final BadgeShape shape;

  /// Allows to set border side to this [badgeContent].
  ///
  /// The default value is [BorderSide.none].
  final BorderSide borderSide;

  /// Allows to edit fit parameter to [Stack] widget.
  ///
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows to set border radius to this [badgeContent].
  ///
  /// The default value is [BorderRadius.zero].
  ///
  /// See also:
  ///
  /// * [borderSide]
  final BorderRadiusGeometry borderRadius;

  /// Specifies padding for [badgeContent].
  ///
  /// The default value is EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  /// Allows you to hide or show [badgeContent].
  ///
  /// The default value is true.
  /// If true, the badge will be displayed, if false, it won't.
  final bool showBadge;

  /// Controls loop of the animation
  ///
  /// The default value is false
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  /// * [animationDuration]
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
                  padding: _calculatePadding(widget.position),
                  child: widget.child!,
                ),
          BadgePositioned(
            /// When the onTap is specified the additional padding is added
            /// Thats why we need to recalculate the position
            position: widget.onTap == null
                ? widget.position
                : _calculatePosition(widget.position),
            child: widget.ignorePointer
                ? IgnorePointer(child: _getBadge())
                : GestureDetector(onTap: widget.onTap, child: _getBadge()),
          ),
        ],
      );
    }
  }

  Widget _getBadge() {
    final border = widget.shape == BadgeShape.circle
        ? CircleBorder(side: widget.borderSide)
        : RoundedRectangleBorder(
            side: widget.borderSide,
            borderRadius: widget.borderRadius,
          );

    Widget _badgeView() {
      return AnimatedOpacity(
        opacity: widget.showBadge ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Material(
          shape: border,
          elevation: widget.elevation,
          color: widget.badgeColor,
          child: Padding(
            padding: widget.padding,
            child: widget.badgeContent,
          ),
        ),
      );
    }

    Widget _badgeViewGradient() {
      return AnimatedOpacity(
        opacity: widget.showBadge ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Material(
          shape: border,
          elevation: widget.elevation,
          child: Container(
            decoration: widget.shape == BadgeShape.circle
                ? BoxDecoration(
                    gradient: widget.gradient,
                    shape: BoxShape.circle,
                  )
                : BoxDecoration(
                    gradient: widget.gradient,
                    shape: BoxShape.rectangle,
                    borderRadius: widget.borderRadius,
                  ),
            child: Padding(
              padding: widget.padding,
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
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      } else if (widget.animationType == BadgeAnimationType.scale) {
        return ScaleTransition(
          scale: _animation,
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      } else if (widget.animationType == BadgeAnimationType.fade) {
        return FadeTransition(
          opacity: _animation,
          child: widget.gradient == null ? _badgeView() : _badgeViewGradient(),
        );
      }
    }

    return widget.gradient == null ? _badgeView() : _badgeViewGradient();
  }

  /// When the onTap is specified the additional padding is added
  /// Thats why we need to recalculate the position
  BadgePosition _calculatePosition(BadgePosition? position) {
    if (position == null) {
      return BadgePosition(end: 0, top: 0);
    }

    double? getUpdatedPosition(double? digit) {
      if (digit == null) {
        return null;
      }
      return !digit.isNegative ? digit : 0;
    }

    return BadgePosition(
      start: getUpdatedPosition(position.start),
      end: getUpdatedPosition(position.end),
      top: getUpdatedPosition(position.top),
      bottom: getUpdatedPosition(position.bottom),
    );
  }

  /// When the onTap is specified, we need to add some padding
  /// to make the full badge tappable.
  EdgeInsets _calculatePadding(BadgePosition? position) {
    if (position == null) {
      return EdgeInsets.only(top: 8, right: 10);
    }

    if (position.isCenter) {
      return EdgeInsets.zero;
    }

    double getUpdatedPadding(double? digit) {
      if (digit == null || !digit.isNegative) {
        return 0;
      }
      return digit.abs();
    }

    if (position.top != null && position.start != null) {
      return EdgeInsets.only(
          top: getUpdatedPadding(widget.position?.top),
          left: getUpdatedPadding(widget.position?.start));
    }
    return EdgeInsets.only(
      top: getUpdatedPadding(widget.position?.top),
      bottom: getUpdatedPadding(widget.position?.bottom),
      left: getUpdatedPadding(widget.position?.start),
      right: getUpdatedPadding(widget.position?.end),
    );
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
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
      _animationController.reset();
      _animationController.forward();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
