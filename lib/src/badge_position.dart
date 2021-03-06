import 'package:badges/badges.dart';

/// Utility class. Don't try to use it!
///
/// This contain a custom position for the [Badge]
class BadgePosition {
  /// This is the distance to the top side of a parent widget.
  final double? top;

  /// This is the distance to the end side of a parent widget.
  final double? end;

  /// This is the distance to the start side of a parent widget.
  final double? start;

  /// This is the distance to the bottom side of a parent widget.
  final double? bottom;

  /// This creates a new instance of this widget
  const BadgePosition({this.top, this.end, this.bottom, this.start});

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [start]
  factory BadgePosition.topStart({double? top, double? start}) {
    return BadgePosition(top: top ?? -5, start: start ?? -10);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [end]
  factory BadgePosition.topEnd({double? top, double? end}) {
    return BadgePosition(top: top ?? -8, end: end ?? -10);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [end]
  factory BadgePosition.bottomEnd({double? bottom, double? end}) {
    return BadgePosition(bottom: bottom ?? -8, end: end ?? -10);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [start]
  factory BadgePosition.bottomStart({double? bottom, double? start}) {
    return BadgePosition(bottom: bottom ?? -8, start: start ?? -10);
  }
}
