import 'package:badges/badges.dart';
import 'package:badges/src/badge_border_gradient.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:badges/src/utils/drawing_utils.dart';
import 'package:material_ui/material_ui.dart';

class Badge extends StatefulWidget {
  const Badge({
    super.key,
    this.badgeContent,
    this.child,
    this.badgeStyle = const BadgeStyle(),
    this.badgeAnimation = const BadgeAnimation.slide(),
    this.position,
    this.showBadge = true,
    this.ignorePointer = false,
    this.stackFit = StackFit.loose,
    this.onTap,
  });

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

  /// Whether the badge ignores taps.
  /// The default value is false.
  /// Keep it false so the badge receives taps ([onTap] and any interactive
  /// [badgeContent] work).
  /// Make it true and all taps will pass through the badge to the widgets
  /// below it. [onTap] is not called then.
  final bool ignorePointer;

  /// Allows to edit fit parameter to [Stack] widget.
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows you to hide or show entire badge.
  /// The default value is true.
  final bool showBadge;

  /// Will be called when you tap on the badge
  /// Important: if the badge is outside of the child
  /// the additional padding will be applied to make the full badge clickable.
  /// This padding makes the whole widget bigger, so it can move the widgets
  /// around it.
  final Function()? onTap;

  @override
  BadgeState createState() => BadgeState();
}

class BadgeState extends State<Badge> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _appearanceController;
  late Animation<double> _animation;
  bool enableLoopAnimation = false;

  /// Provides access to the main animation controller for advanced use cases.
  AnimationController get animationController => _animationController;

  /// Provides access to the appearance/disappearance controller.
  AnimationController get appearanceController => _appearanceController;

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

  /// A hidden badge must not catch taps meant for the widgets below it.
  Widget _getTappableBadge() {
    return IgnorePointer(
      ignoring: widget.ignorePointer || !widget.showBadge,
      child: GestureDetector(onTap: widget.onTap, child: _getBadge()),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return _getTappableBadge();
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
            child: _getTappableBadge(),
          ),
        ],
      );
    }
  }

  Widget _getBadge() {
    final isCustomShape =
        widget.badgeStyle.shape == BadgeShape.twitter ||
        widget.badgeStyle.shape == BadgeShape.instagram;

    // For non-custom shapes, build a BoxBorder for the BoxDecoration.
    // Gradient border takes priority; otherwise use a solid border drawn inside
    // the circle so the background colour does not bleed past antialiased edges.
    final BoxBorder? boxBorder;
    if (!isCustomShape) {
      if (widget.badgeStyle.borderGradient != null) {
        boxBorder = BadgeBorderGradient(
          gradient: widget.badgeStyle.borderGradient!.gradient(),
          width: widget.badgeStyle.borderSide.width,
        );
      } else if (widget.badgeStyle.borderSide != BorderSide.none) {
        boxBorder = Border.all(
          color: widget.badgeStyle.borderSide.color,
          width: widget.badgeStyle.borderSide.width,
          strokeAlign: BorderSide.strokeAlignInside,
        );
      } else {
        boxBorder = null;
      }
    } else {
      boxBorder = null;
    }

    // Material shape uses no side so the elevation shadow is rendered without
    // a border; the border lives entirely inside BoxDecoration instead.
    final ShapeBorder materialShape =
        widget.badgeStyle.shape == BadgeShape.circle
        ? const CircleBorder()
        : RoundedRectangleBorder(borderRadius: widget.badgeStyle.borderRadius);

    return _BadgeVisual(
      badgeStyle: widget.badgeStyle,
      badgeAnimation: widget.badgeAnimation,
      badgeContent: widget.badgeContent,
      appearanceController: _appearanceController,
      showBadge: widget.showBadge,
      animation: _animation,
      isCustomShape: isCustomShape,
      boxBorder: boxBorder,
      materialShape: materialShape,
    );
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Always update controller durations when they change.
    if (widget.badgeAnimation.animationDuration !=
        oldWidget.badgeAnimation.animationDuration) {
      _animationController.duration = widget.badgeAnimation.animationDuration;
      _animationController.reverseDuration =
          widget.badgeAnimation.animationDuration;
    }
    if (widget.badgeAnimation.disappearanceFadeAnimationDuration !=
        oldWidget.badgeAnimation.disappearanceFadeAnimationDuration) {
      _appearanceController.duration =
          widget.badgeAnimation.disappearanceFadeAnimationDuration;
      _appearanceController.reverseDuration =
          widget.badgeAnimation.disappearanceFadeAnimationDuration;
    }

    if (!widget.badgeAnimation.toAnimate) return;

    // Animations were off, so the controllers never ran. Jump them to the
    // end so the badge doesn't turn invisible.
    if (!oldWidget.badgeAnimation.toAnimate) {
      if (widget.showBadge) {
        _animationController.value = 1;
        _appearanceController.value = 1;
        if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
          _animationController.repeat(
            period: _animationController.duration,
            reverse: true,
          );
        }
      }
      return;
    }

    // --- showBadge changes are handled FIRST (fixes issue #114) ---

    // Badge became visible.
    if (widget.showBadge && !oldWidget.showBadge) {
      _animationController.forward();
      _appearanceController.forward();
      if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
        _animationController.repeat(
          period: _animationController.duration,
          reverse: true,
        );
      }
      return;
    }

    // Badge became hidden — stop immediately then reverse (fixes issue #130).
    if (!widget.showBadge && oldWidget.showBadge) {
      _animationController.stop();
      _appearanceController.stop();
      _animationController.reverse();
      _appearanceController.reverse();
      return;
    }

    // --- Loop animation toggle ---

    // Loop turned on.
    if (widget.badgeAnimation.loopAnimation &&
        !oldWidget.badgeAnimation.loopAnimation &&
        enableLoopAnimation) {
      _animationController.repeat(
        period: _animationController.duration,
        reverse: true,
      );
      return;
    }

    // Loop turned off → play to end once.
    if (!widget.badgeAnimation.loopAnimation &&
        oldWidget.badgeAnimation.loopAnimation &&
        enableLoopAnimation) {
      _animationController.forward();
      // fall through to content-change checks below
    }

    // Loop is active and still running — keep it going (or restart if stopped).
    if (widget.badgeAnimation.loopAnimation && enableLoopAnimation) {
      if (_animationController.isAnimating) return;
      _animationController.repeat(
        period: _animationController.duration,
        reverse: true,
      );
      return;
    }

    // --- Content-change re-triggers (only when badge is visible) ---

    if (widget.badgeStyle.badgeColor != oldWidget.badgeStyle.badgeColor &&
        widget.showBadge) {
      _animationController.reset();
      _animationController.forward();
    }

    if (widget.badgeContent is Text && oldWidget.badgeContent is Text) {
      final newText = widget.badgeContent as Text;
      final oldText = oldWidget.badgeContent as Text;
      if (newText.data != oldText.data && widget.showBadge) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    if (widget.badgeContent is Icon && oldWidget.badgeContent is Icon) {
      final newIcon = widget.badgeContent as Icon;
      final oldIcon = oldWidget.badgeContent as Icon;
      if (newIcon.icon != oldIcon.icon && widget.showBadge) {
        _animationController.reset();
        _animationController.forward();
      }
    }

    // For custom widget content: if the user sets a key on badgeContent,
    // changing the key triggers re-animation (partial fix for issue #115).
    if (widget.badgeContent?.key != null &&
        widget.badgeContent!.key != oldWidget.badgeContent?.key &&
        widget.showBadge) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _appearanceController.dispose();
    super.dispose();
  }
}

// ---------------------------------------------------------------------------
// Private widget — extracted from the old badgeView() inner closure (PR #120).
// Using a proper StatelessWidget allows Flutter's element tree to cache it and
// avoid rebuilding the full subtree on every _appearanceController tick.
// ---------------------------------------------------------------------------

class _BadgeVisual extends StatelessWidget {
  const _BadgeVisual({
    required this.badgeStyle,
    required this.badgeAnimation,
    required this.badgeContent,
    required this.appearanceController,
    required this.showBadge,
    required this.animation,
    required this.isCustomShape,
    required this.boxBorder,
    required this.materialShape,
  });

  final BadgeStyle badgeStyle;
  final BadgeAnimation badgeAnimation;
  final Widget? badgeContent;
  final AnimationController appearanceController;
  final bool showBadge;
  final Animation<double> animation;
  final bool isCustomShape;
  final BoxBorder? boxBorder;
  final ShapeBorder materialShape;

  double _getOpacity() {
    if (!badgeAnimation.toAnimate) {
      return showBadge ? 1.0 : 0.0;
    } else if (!badgeAnimation.appearanceDisappearanceFadeAnimationEnabled) {
      return 1.0;
    }
    return appearanceController.value;
  }

  Widget _buildInner() {
    if (isCustomShape) {
      return CustomPaint(
        painter: DrawingUtils.drawBadgeShape(
          shape: badgeStyle.shape,
          color: badgeStyle.badgeColor,
          badgeGradient: badgeStyle.badgeGradient,
          borderGradient: badgeStyle.borderGradient,
          borderSide: badgeStyle.borderSide,
        ),
        child: Padding(padding: badgeStyle.padding, child: badgeContent),
      );
    }

    Widget container = AnimatedContainer(
      curve: badgeAnimation.colorChangeAnimationCurve,
      duration: badgeAnimation.toAnimate
          ? badgeAnimation.colorChangeAnimationDuration
          : Duration.zero,
      decoration: badgeStyle.shape == BadgeShape.circle
          ? BoxDecoration(
              color: badgeStyle.badgeColor,
              border: boxBorder,
              gradient: badgeStyle.badgeGradient?.gradient(),
              shape: BoxShape.circle,
            )
          : BoxDecoration(
              color: badgeStyle.badgeColor,
              gradient: badgeStyle.badgeGradient?.gradient(),
              shape: BoxShape.rectangle,
              borderRadius: badgeStyle.borderRadius,
              border: boxBorder,
            ),
      // IntrinsicWidth sizes the badge to its content's natural width.
      child: IntrinsicWidth(
        child: Padding(padding: badgeStyle.padding, child: badgeContent),
      ),
    );

    // MaterialType.transparency never paints a shadow, so the elevation
    // shadow is drawn here instead.
    if (badgeStyle.elevation > 0) {
      container = PhysicalShape(
        clipper: ShapeBorderClipper(shape: materialShape),
        elevation: badgeStyle.elevation,
        color: Colors.transparent,
        shadowColor: Colors.black,
        child: container,
      );
    }

    return Material(
      shape: materialShape,
      // Without this Colors.transparent will be ignored
      type: MaterialType.transparency,
      child: container,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the controller directly: a new CurvedAnimation per build
    // would add a listener to the controller every time and never remove it.
    final inner = AnimatedBuilder(
      animation: appearanceController,
      builder: (context, child) {
        return Opacity(opacity: _getOpacity(), child: child);
      },
      child: _buildInner(),
    );

    if (!badgeAnimation.toAnimate) return inner;

    if (badgeAnimation.animationType == BadgeAnimationType.slide) {
      return SlideTransition(
        position: badgeAnimation.slideTransitionPositionTween!
            .toTween()
            .animate(animation),
        child: inner,
      );
    } else if (badgeAnimation.animationType == BadgeAnimationType.scale) {
      return ScaleTransition(scale: animation, child: inner);
    } else if (badgeAnimation.animationType == BadgeAnimationType.fade) {
      return FadeTransition(opacity: animation, child: inner);
    } else if (badgeAnimation.animationType == BadgeAnimationType.size) {
      final axis = badgeAnimation.sizeTransitionAxis ?? Axis.horizontal;
      final axisAlignment = badgeAnimation.sizeTransitionAxisAlignment ?? 1.0;
      return SizeTransition(
        sizeFactor: animation,
        axis: axis,
        alignment: switch (axis) {
          Axis.horizontal => AlignmentDirectional(axisAlignment, -1.0),
          Axis.vertical => AlignmentDirectional(-1.0, axisAlignment),
        },
        child: inner,
      );
    } else if (badgeAnimation.animationType == BadgeAnimationType.rotation) {
      return RotationTransition(turns: animation, child: inner);
    }

    return inner;
  }
}
