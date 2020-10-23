class BadgePosition {
  final double top;
  final double end;
  final double bottom;
  final double start;

  const BadgePosition({this.top, this.end, this.bottom, this.start});

  factory BadgePosition.topStart({double top, double start}) {
    return BadgePosition(top: top ?? -5, start: start ?? -10);
  }

  factory BadgePosition.topEnd({double top, double end}) {
    return BadgePosition(top: top ?? -8, end: end ?? -10);
  }

  factory BadgePosition.bottomEnd({double bottom, double end}) {
    return BadgePosition(bottom: bottom ?? -8, end: end ?? -10);
  }

  factory BadgePosition.bottomStart({double bottom, double start}) {
    return BadgePosition(bottom: bottom ?? -8, start: start ?? -10);
  }
}
