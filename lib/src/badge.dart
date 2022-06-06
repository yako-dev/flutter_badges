import 'package:badges/src/badge_animation_type.dart';
import 'package:badges/src/badge_position.dart';
import 'package:badges/src/badge_positioned.dart';
import 'package:badges/src/badge_shape.dart';
import 'package:flutter/material.dart';

/// This widget allows you to add badges to any of your [Widget].
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
  Badge(
      {Key? key,
      this.badgeContent,
      this.child,
      this.badgeColor = Colors.red,
      this.elevation = 2,
      this.toAnimate = true,
      this.position,
      this.shape = BadgeShape.circle,
      this.padding = const EdgeInsets.all(5.0),
      this.animationDuration = const Duration(milliseconds: 500),
      this.borderRadius = BorderRadius.zero,
      this.alignment = Alignment.center,
      this.animationType = BadgeAnimationType.slide,
      this.showBadge = true,
      this.ignorePointer = false,
      this.borderSide = BorderSide.none,
      this.stackFit = StackFit.loose,
      this.gradient,
      this.onTap,
      this.curve})
      : super(key: key);

  /// It defines the widget that will be wrapped by this [badgeContent].
  final Widget? child;

  /// This defines alignment for your [child].
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

  /// Allows you to set the color for this [badgeContent].
  final Color badgeColor;

  /// Allows you to set the gradient color for this [badgeContent]
  final Gradient? gradient;

  /// This controls the size of the shadow below the material and the opacity.
  /// of the elevation overlay color if it is applied.
  final double elevation;

  /// This controls animation status.
  ///
  /// The default value is true.
  /// If true, the animation is allowed, if false, the animation is forbidden.
  ///
  /// See also:
  ///
  /// * [animationDuration]
  /// * [animationType]
  final bool toAnimate;

  /// This controls the duration of the animation.
  ///
  /// The default value is Duration(milliseconds: 500).
  ///
  /// See also:
  ///
  /// * [toAnimate]
  /// * [animationType]
  final Duration animationDuration;

  /// This controls the type of the animation.
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

  /// Specify padding for [badgeContent].
  ///
  /// The default value is EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  /// Allows you to hide or show [badgeContent].
  ///
  /// The default value is true.
  /// If true, the badge will be displayed, if false, it doesn't.
  final bool showBadge;

  final Function()? onTap;

  final Curve? curve;

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
      vsync: this,
    );

    if (widget.animationType == BadgeAnimationType.slide) {
      _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.curve ?? Curves.elasticOut,
      );
    } else if (widget.animationType == BadgeAnimationType.scale) {
      _animation = _scaleTween.animate(_animationController);
    } else if (widget.animationType == BadgeAnimationType.fade) {
      _animation = CurvedAnimation(
        parent: _animationController,
        curve: widget.curve ?? Curves.easeIn,
      );
    }

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return _getBadge();
    } else {
      return Stack(
        fit: widget.stackFit,
        alignment: widget.alignment,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: getPadding(widget.position),
            child: widget.child!,
          ),
          BadgePositioned(
            position: getPosition(widget.position),
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
      Widget child = Material(
        shape: border,
        elevation: widget.elevation,
        color: widget.badgeColor,
        child: Padding(
          padding: widget.padding,
          child: widget.badgeContent,
        ),
      );

      switch (widget.animationType) {
        case BadgeAnimationType.slide:
          return AnimatedOpacity(
            opacity: widget.showBadge ? 1 : 0,
            duration: widget.animationDuration,
            child: AnimatedSlide(
              offset: widget.showBadge ? Offset(0.0, 0.0) : Offset(-1, 1),
              duration: widget.animationDuration,
              curve: widget.curve ?? Curves.easeOut,
              child: child,
            ),
          );
        case BadgeAnimationType.scale:
          return AnimatedScale(
            scale: widget.showBadge ? 1 : 0,
            duration: widget.animationDuration,
            child: child,
          );
        case BadgeAnimationType.fade:
          return AnimatedOpacity(
            opacity: widget.showBadge ? 1 : 0,
            duration: widget.animationDuration,
            child: child,
          );
      }
    }

    Widget _badgeViewGradient() {
      Widget child = Material(
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
      );
      switch (widget.animationType) {
        case BadgeAnimationType.scale:
          return AnimatedScale(
            scale: widget.showBadge ? 1 : 0,
            duration: widget.animationDuration,
            child: child,
          );
        case BadgeAnimationType.fade:
          return AnimatedOpacity(
            opacity: widget.showBadge ? 1 : 0,
            duration: widget.animationDuration,
            child: child,
          );
        case BadgeAnimationType.slide:
          return AnimatedOpacity(
            opacity: widget.showBadge ? 1 : 0,
            duration: widget.animationDuration,
            child: AnimatedSlide(
              offset: widget.showBadge ? Offset(0.0, 0.0) : Offset(-1, 1),
              duration: widget.animationDuration,
              curve: widget.curve ?? Curves.easeOut,
              child: child,
            ),
          );
      }
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

  BadgePosition? getPosition(BadgePosition? position) {
    double? top, bottom, start, end;
    if (position != null) {
      if (position.isCenter) {
        return position;
      }
      if (position.start != null) {
        if (!position.start!.isNegative) {
          start = position.start!;
        } else {
          start = 0;
        }
      }
      if (position.end != null) {
        if (!position.end!.isNegative) {
          end = position.end!;
        } else {
          end = 0;
        }
      }
      if (position.top != null) {
        if (!position.top!.isNegative) {
          top = position.top!;
        } else {
          top = 0;
        }
      }
      if (position.bottom != null) {
        if (!position.bottom!.isNegative) {
          bottom = position.bottom!;
        } else {
          bottom = 0;
        }
      }
      return BadgePosition(start: start, end: end, top: top, bottom: bottom);
    }
    return BadgePosition(
      end: 0,
      top: 0,
    );
  }

  EdgeInsets getPadding(BadgePosition? position) {
    if (position != null) {
      if (position.isCenter) {
        return EdgeInsets.zero;
      }
      if (position.top != null && position.start != null) {
        return EdgeInsets.only(
            top: (widget.position!.top ?? 0).isNegative
                ? (widget.position!.top ?? 0).abs()
                : 0,
            left: (widget.position!.start ?? 0).isNegative
                ? (widget.position!.start ?? 0).abs()
                : 0);
      }
      return EdgeInsets.only(
        top: (widget.position!.top ?? 0).isNegative
            ? (widget.position!.top ?? 0).abs()
            : 0,
        bottom: (widget.position!.bottom ?? 0).isNegative
            ? (widget.position!.bottom ?? 0).abs()
            : 0,
        left: (widget.position!.start ?? 0).isNegative
            ? (widget.position!.start ?? 0).abs()
            : 0,
        right: (widget.position!.end ?? 0).isNegative
            ? (widget.position!.end ?? 0).abs()
            : 0,
      );
    }
    return EdgeInsets.only(top: 8, right: 10);
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    if (widget.badgeContent is Text && oldWidget.badgeContent is Text) {
      final newText = widget.badgeContent as Text;
      final oldText = oldWidget.badgeContent as Text;
      if (newText.data != oldText.data) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    if (widget.badgeContent is Icon && oldWidget.badgeContent is Icon) {
      final newIcon = widget.badgeContent as Icon;
      final oldIcon = oldWidget.badgeContent as Icon;
      if (newIcon.icon != oldIcon.icon) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
