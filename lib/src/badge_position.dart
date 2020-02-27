class BadgePosition {
  final double top;
  final double right;
  final double bottom;
  final double left;

  const BadgePosition({this.top, this.right, this.bottom, this.left});

  factory BadgePosition.topLeft({double top, double left}) {
    return BadgePosition(top: top ?? -5, left: left ?? -10);
  }

  factory BadgePosition.topRight({double top, double right}) {
    return BadgePosition(top: top ?? -8, right: right ?? -10);
  }

  factory BadgePosition.bottomRight({double bottom, double right}) {
    return BadgePosition(bottom: bottom ?? -8, right: right ?? -10);
  }

  factory BadgePosition.bottomLeft({double bottom, double left}) {
    return BadgePosition(bottom: bottom ?? -8, left: left ?? -10);
  }
}
