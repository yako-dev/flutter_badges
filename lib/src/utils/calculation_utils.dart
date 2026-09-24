import 'package:badges/badges.dart';
import 'package:flutter/widgets.dart';

class CalculationUtils {
  /// When the onTap is specified the additional padding is added
  /// Thats why we need to recalculate the position
  static BadgePosition calculatePosition(BadgePosition? position) {
    if (position == null) {
      return BadgePosition.custom(end: 0, top: 0);
    }

    double? getUpdatedPosition(double? digit) {
      if (digit == null) {
        return null;
      }
      return !digit.isNegative ? digit : 0;
    }

    if (position.isCenter) {
      return BadgePosition.custom(
        start: getUpdatedPosition(position.start),
        end: getUpdatedPosition(position.end),
        isCenter: true,
      );
    }

    return BadgePosition.custom(
      start: getUpdatedPosition(position.start),
      end: getUpdatedPosition(position.end),
      top: getUpdatedPosition(position.top),
      bottom: getUpdatedPosition(position.bottom),
    );
  }

  /// When the onTap is specified, we need to add some padding
  /// to make the full badge tappable.
  /// The padding is directional because the badge is positioned with
  /// start/end, so it stays correct in right-to-left layouts.
  static EdgeInsetsDirectional calculatePadding(BadgePosition? position) {
    if (position == null) {
      return const EdgeInsetsDirectional.only(top: 8, end: 10);
    }

    double getUpdatedPadding(double? digit) {
      if (digit == null || !digit.isNegative) {
        return 0;
      }
      return digit.abs();
    }

    if (position.isCenter) {
      return EdgeInsetsDirectional.only(
        start: getUpdatedPadding(position.start),
        end: getUpdatedPadding(position.end),
      );
    }

    if (position.top != null && position.start != null) {
      return EdgeInsetsDirectional.only(
        top: getUpdatedPadding(position.top),
        start: getUpdatedPadding(position.start),
      );
    }
    return EdgeInsetsDirectional.only(
      top: getUpdatedPadding(position.top),
      bottom: getUpdatedPadding(position.bottom),
      start: getUpdatedPadding(position.start),
      end: getUpdatedPadding(position.end),
    );
  }

  static Offset calculateOffset({
    required AlignmentGeometry alignment,
    required double width,
    required double height,
  }) {
    if (alignment == Alignment.topLeft) {
      return Offset(width * 0.191, height * 0.191);
    } else if (alignment == Alignment.center) {
      return Offset(width * 0.5, height * 0.5);
    } else if (alignment == Alignment.bottomRight) {
      return Offset(width * 0.809, height * 0.809);
    } else if (alignment == Alignment.centerLeft) {
      return Offset(width * 0.06, height * 0.5);
    } else if (alignment == Alignment.bottomCenter) {
      return Offset(width * 0.5, height * 0.94);
    } else if (alignment == Alignment.bottomLeft) {
      return Offset(width * 0.191, height * 0.809);
    } else if (alignment == Alignment.centerRight) {
      return Offset(width * 0.94, height * 0.5);
    } else if (alignment == Alignment.topCenter) {
      return Offset(width * 0.5, height * 0.06);
    } else if (alignment == Alignment.topRight) {
      return Offset(width * 0.809, height * 0.191);
    }
    // Any other alignment (e.g. AlignmentDirectional) maps to its point in
    // the badge rect.
    return alignment
        .resolve(TextDirection.ltr)
        .withinRect(Offset.zero & Size(width, height));
  }
}
