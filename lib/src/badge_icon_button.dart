library badges;

import 'package:flutter/material.dart';

class BadgeIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final int itemCount;
  final Color badgeColor;
  final Color badgeTextColor;
  final Icon icon;
  final bool hideZeroCount;

  BadgeIconButton({
    Key key,
    @required this.itemCount,
    @required this.icon,
    this.onPressed,
    this.hideZeroCount: true,
    this.badgeColor: Colors.red,
    this.badgeTextColor: Colors.white,
  })  : assert(itemCount >= 0),
        assert(badgeColor != null),
        assert(badgeTextColor != null),
        super(key: key);

  @override
  BadgeIconButtonState createState() {
    return BadgeIconButtonState();
  }
}

class BadgeIconButtonState extends State<BadgeIconButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  final Tween<Offset> _badgePositionTween = Tween(
    begin: const Offset(-0.5, 0.9),
    end: const Offset(0.0, 0.0),
  );

  @override
  Widget build(BuildContext context) {
    if (widget.hideZeroCount && widget.itemCount == 0) {
      return IconButton(
        icon: widget.icon,
        onPressed: widget.onPressed,
      );
    }

    return IconButton(
        icon: Stack(
          overflow: Overflow.visible,
          children: [
            widget.icon,
            Positioned(
              top: -8.0,
              right: -3.0,
              child: SlideTransition(
                position: _badgePositionTween.animate(_animation),
                child: Material(
                    type: MaterialType.circle,
                    elevation: 2.0,
                    color: widget.badgeColor,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.itemCount.toString(),
                        style: TextStyle(
                          fontSize: 13.0,
                          color: widget.badgeTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
        onPressed: widget.onPressed);
  }

  @override
  void didUpdateWidget(BadgeIconButton oldWidget) {
    if (widget.itemCount != oldWidget.itemCount) {
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

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
    _animationController.forward();
  }
}
