import 'package:badges/badges.dart';
import 'package:badges/src/badge_position.dart';
import 'package:flutter/widgets.dart';

/// Utility class. Don't try to use it!
///
/// This is just a comfortable wrap for [PositionedDirectional],
/// [BadgePosition] and [child].
class BadgePositioned extends StatelessWidget {
  /// Specifies badge position according to [child]
  final BadgePosition? position;

  /// It is a child that will be displayed according to [position]
  final Widget child;

  /// Creates a new instance of [BadgePositioned].
  ///
  /// See also:
  /// * [PositionedDirectional]
  const BadgePositioned({Key? key, this.position, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = this.position;
    if (position == null) {
      final topEnd = BadgePosition.topEnd();
      return PositionedDirectional(
        top: topEnd.top,
        end: topEnd.end,
        child: child,
      );
    }

    if (position.isCenter) {
      return Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
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
