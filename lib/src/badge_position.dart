import 'package:badges/badges.dart';

/// Utility class. Don't try to use it!
///
/// This contains a custom position for the [Badge]
class BadgePosition {
  /// Distance to the top side of a parent widget.
  final double? top;

  /// Distance to the end side of a parent widget.
  final double? end;

  /// Distance to the start side of a parent widget.
  final double? start;

  /// Distance to the bottom side of a parent widget.
  final double? bottom;

  /// Indicates that the badge is in center of parent widget
  final bool isCenter;

  /// This creates a new instance of this widget
  const BadgePosition._({
    this.top,
    this.end,
    this.bottom,
    this.start,
    this.isCenter = false,
  });

  /// Factory method that creates a new instance of this widget
  /// according to the center
  factory BadgePosition.center() {
    return const BadgePosition._(isCenter: true);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [start]
  factory BadgePosition.topStart({double top = -5, double start = -10}) {
    return BadgePosition._(top: top, start: start);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [top] and [end]
  factory BadgePosition.topEnd({double top = -8, double end = -10}) {
    return BadgePosition._(top: top, end: end);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [end]
  factory BadgePosition.bottomEnd({double bottom = -8, double end = -10}) {
    return BadgePosition._(bottom: bottom, end: end);
  }

  /// Factory method that creates a new instance of this widget
  /// according to [bottom] and [start]
  factory BadgePosition.bottomStart({double bottom = -8, double start = -10}) {
    return BadgePosition._(bottom: bottom, start: start);
  }

  factory BadgePosition.custom({
    double? start,
    double? end,
    double? top,
    double? bottom,
    bool isCenter = false,
  }) {
    return BadgePosition._(
        top: top, end: end, bottom: bottom, start: start, isCenter: isCenter);
  }
}
