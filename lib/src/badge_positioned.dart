import 'package:badges/badges.dart';
import 'package:badges/src/badge_position.dart';
import 'package:flutter/widgets.dart';

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [PositionedDirectional],
/// [BadgePosition] and [child].
class BadgePositioned extends StatelessWidget {
  /// This specify a badge position according to [child]
  final BadgePosition? position;

  /// It is a child that will be displayed according to [position]
  final Widget child;

  /// This creates a new instance of [BadgePositioned].
  ///
  /// See also:
  /// * [PositionedDirectional]
  const BadgePositioned({Key? key, this.position, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topRight = BadgePosition.topEnd();
      return PositionedDirectional(
        top: topRight.top,
        end: topRight.end,
        child: child,
      );
    }
    return PositionedDirectional(
      top: position.top,
      end: position.end,
      bottom: position.bottom,
      start: position.start,
      child: child,
    );
  }
}
