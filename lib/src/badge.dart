import 'package:badges/src/badge_animation_type.dart';
import 'package:badges/src/badge_position.dart';
import 'package:badges/src/badge_positioned.dart';
import 'package:badges/src/badge_shape.dart';
import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  final Widget badgeContent;
  final Color badgeColor;
  final Widget child;
  final double elevation;
  final bool toAnimate;
  final BadgePosition position;
  final BadgeShape shape;
  final EdgeInsets padding;
  final Duration animationDuration;
  final double borderRadius;
  final BadgeAnimationType animationType;

  Badge({
    Key key,
    this.badgeContent,
    this.child,
    this.badgeColor: Colors.red,
    this.elevation: 2,
    this.toAnimate: true,
    this.position,
    this.shape: BadgeShape.circle,
    this.padding: const EdgeInsets.all(5.0),
    this.animationDuration: const Duration(milliseconds: 500),
    this.borderRadius,
    this.animationType: BadgeAnimationType.slide,
  }) : super(key: key);

  @override
  BadgeState createState() {
    return BadgeState();
  }
}

class BadgeState extends State<Badge> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

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
          parent: _animationController, curve: Curves.elasticOut);
    } else if (widget.animationType == BadgeAnimationType.scale) {
      _animation = _scaleTween.animate(_animationController);
    } else if (widget.animationType == BadgeAnimationType.fade) {
      _animation =
          CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    }

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.child == null) {
      return _getBadge();
    } else {
      return Stack(
        overflow: Overflow.visible,
        children: [
          widget.child,
          BadgePositioned(
            position: widget.position,
            child: _getBadge(),
          ),
        ],
      );
    }
  }

  Widget _getBadge() {
    MaterialType type;
    if (widget.shape == BadgeShape.circle) {
      type = MaterialType.circle;
    } else if (widget.shape == BadgeShape.square) {
      type = MaterialType.card;
    } else {
      print('Unknown material type for badge. Used Card');
      type = MaterialType.card;
    }
    RoundedRectangleBorder border = type == MaterialType.circle
        ? null
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0));

    Widget badgeView() {
      return Material(
        shape: border,
        type: type,
        elevation: widget.elevation,
        color: widget.badgeColor,
        child: Padding(
          padding: widget.padding,
          child: widget.badgeContent,
        ),
      );
    }

    if (widget.toAnimate) {
      if (widget.animationType == BadgeAnimationType.slide) {
        return SlideTransition(
          position: _positionTween.animate(_animation),
          child: badgeView(),
        );
      } else if (widget.animationType == BadgeAnimationType.scale) {
        return ScaleTransition(
          scale: _animation,
          child: badgeView(),
        );
      } else if (widget.animationType == BadgeAnimationType.fade) {
        return FadeTransition(
          opacity: _animation,
          child: badgeView(),
        );
      }
    }

    return badgeView();
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.badgeContent != oldWidget.badgeContent) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
