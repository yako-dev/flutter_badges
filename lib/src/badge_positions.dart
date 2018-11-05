import 'package:badges/src/badge_position.dart';
import 'package:flutter/widgets.dart';

class BadgePositioned extends StatelessWidget {
  final Widget child;
  final BadgePosition position;

  const BadgePositioned({Key key, this.position, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (position) {
      case BadgePosition.topLeft:
        return Positioned(top: -8.0, left: -3.0, child: child);
      case BadgePosition.topRight:
        return Positioned(top: -8.0, right: -3.0, child: child);
      case BadgePosition.center:
        return Positioned(child: child);
      case BadgePosition.bottomLeft:
        return Positioned(bottom: -8.0, left: -3.0, child: child);
      case BadgePosition.bottomRight:
        return Positioned(bottom: -8.0, right: -3.0, child: child);
      default:
        return Positioned(top: -8.0, right: -3.0, child: child);
    }
  }
}
