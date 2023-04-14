import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

/// Set of shapes that you can use for your [badges.Badge] widget.
enum BadgeShape {
  /// To make the badge circular. This is the default shape.
  ///
  /// See also:
  /// * [CircleBorder]
  circle,

  /// To make the badge square.
  ///
  /// See also:
  /// * [RoundedRectangleBorder]
  square,

  /// To make the  twitter badge .
  /// See [TwitterBadgeShapePainter] for more details.
  twitter,

  /// To make the instagram badge .
  /// See [InstagramBadgeShapePainter] for more details.
  instagram,
}
