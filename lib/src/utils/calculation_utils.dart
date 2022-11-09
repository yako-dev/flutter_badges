import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CalculationUtils {
  /// When the onTap is specified the additional padding is added
  /// Thats why we need to recalculate the position
  static BadgePosition calculatePosition(BadgePosition? position) {
    if (position == null) {
      return const BadgePosition(end: 0, top: 0);
    }

    double? getUpdatedPosition(double? digit) {
      if (digit == null) {
        return null;
      }
      return !digit.isNegative ? digit : 0;
    }

    return BadgePosition(
      start: getUpdatedPosition(position.start),
      end: getUpdatedPosition(position.end),
      top: getUpdatedPosition(position.top),
      bottom: getUpdatedPosition(position.bottom),
    );
  }

  /// When the onTap is specified, we need to add some padding
  /// to make the full badge tappable.
  static EdgeInsets calculatePadding(BadgePosition? position) {
    if (position == null) {
      return const EdgeInsets.only(top: 8, right: 10);
    }

    if (position.isCenter) {
      return EdgeInsets.zero;
    }

    double getUpdatedPadding(double? digit) {
      if (digit == null || !digit.isNegative) {
        return 0;
      }
      return digit.abs();
    }

    if (position.top != null && position.start != null) {
      return EdgeInsets.only(
          top: getUpdatedPadding(position.top),
          left: getUpdatedPadding(position.start));
    }
    return EdgeInsets.only(
      top: getUpdatedPadding(position.top),
      bottom: getUpdatedPadding(position.bottom),
      left: getUpdatedPadding(position.start),
      right: getUpdatedPadding(position.end),
    );
  }
}
