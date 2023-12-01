import 'package:badges/badges.dart' as badges;
import 'package:badges/src/painters/instagram_badge_shape_painter.dart';
import 'package:badges/src/painters/twitter_badge_shape_painter.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:badges/src/utils/drawing_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void testUtils() {
  group('CalculationUtils', () {
    test('Passing null', () async {
      final badges.BadgePosition position =
          CalculationUtils.calculatePosition(null);
      expect(position.top, 0);
      expect(position.end, 0);
      expect(position.start, null);
      expect(position.bottom, null);
      expect(position.isCenter, false);
    });

    test('Null values', () async {
      final position = CalculationUtils.calculatePosition(
        badges.BadgePosition.custom(
            top: null, end: null, bottom: null, start: null),
      );
      expect(position.top, null);
      expect(position.end, null);
      expect(position.bottom, null);
      expect(position.start, null);
      expect(position.isCenter, false);
    });

    test('Negative values', () async {
      final position = CalculationUtils.calculatePosition(
          badges.BadgePosition.custom(
              top: -10, end: -10, bottom: -10, start: -10));
      expect(position.top, 0);
      expect(position.end, 0);
      expect(position.bottom, 0);
      expect(position.start, 0);
      expect(position.isCenter, false);
    });

    test('Normal values', () async {
      final position = CalculationUtils.calculatePosition(
        badges.BadgePosition.custom(top: 15, end: 15, bottom: 15, start: 15),
      );
      expect(position.top, 15);
      expect(position.end, 15);
      expect(position.bottom, 15);
      expect(position.start, 15);
    });
  });

  group('CalculationUtils.calculatePadding', () {
    test('Passing null', () async {
      final padding = CalculationUtils.calculatePaddingByPosition(null);
      expect(padding.top, 8);
      expect(padding.right, 10);
      expect(padding.bottom, 0);
      expect(padding.left, 0);
    });

    test('isCenter = true', () async {
      final padding = CalculationUtils.calculatePaddingByPosition(
        badges.BadgePosition.custom(isCenter: true, top: -10, end: 20),
      );
      expect(padding.top, 0);
      expect(padding.right, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 0);
    });

    test('Null values', () async {
      final padding = CalculationUtils.calculatePaddingByPosition(
        badges.BadgePosition.custom(
            top: null, end: null, bottom: null, start: null),
      );
      expect(padding.top, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 0);
      expect(padding.right, 0);
    });

    test('Top and start values', () async {
      final padding = CalculationUtils.calculatePaddingByPosition(
        badges.BadgePosition.custom(top: -5, end: -5, bottom: -5, start: -5),
      );
      expect(padding.top, 5);
      expect(padding.left, 5);
      expect(padding.bottom, 0);
      expect(padding.right, 0);
    });

    test('Without top and start values and negative end bottom values',
        () async {
      final padding = CalculationUtils.calculatePaddingByPosition(
        badges.BadgePosition.custom(end: -5, bottom: -5),
      );
      expect(padding.top, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 5);
      expect(padding.right, 5);
    });

    test('Without top and start values and normal end bottom values', () async {
      final padding = CalculationUtils.calculatePaddingByPosition(
        badges.BadgePosition.custom(end: 5, bottom: 5),
      );
      expect(padding.top, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 0);
      expect(padding.right, 0);
    });
  });

  group('CalculationUtils.calculateOffset', () {
    Offset getOffset(AlignmentGeometry alignment) {
      return CalculationUtils.calculateOffset(
          alignment: alignment, width: 100, height: 100);
    }

    test('Alignment topLeft', () async {
      final offset = getOffset(Alignment.topLeft);
      expect(offset.dx, 19.1);
      expect(offset.dy, 19.1);
    });

    test('Alignment center', () async {
      final offset = getOffset(Alignment.center);
      expect(offset.dx, 50);
      expect(offset.dy, 50);
    });

    test('Alignment bottomRight', () async {
      final offset = getOffset(Alignment.bottomRight);
      expect(offset.dx, 80.9);
      expect(offset.dy, 80.9);
    });

    test('Alignment centerLeft', () async {
      final offset = getOffset(Alignment.centerLeft);
      expect(offset.dx, 6);
      expect(offset.dy, 50);
    });

    test('Alignment bottomCenter', () async {
      final offset = getOffset(Alignment.bottomCenter);
      expect(offset.dx, 50);
      expect(offset.dy, 94);
    });

    test('Alignment bottomLeft', () async {
      final offset = getOffset(Alignment.bottomLeft);
      expect(offset.dx, 19.1);
      expect(offset.dy, 80.9);
    });

    test('Alignment centerRight', () async {
      final offset = getOffset(Alignment.centerRight);
      expect(offset.dx, 94);
      expect(offset.dy, 50);
    });

    test('Alignment topCenter', () async {
      final offset = getOffset(Alignment.topCenter);
      expect(offset.dx, 50);
      expect(offset.dy, 6);
    });

    test('Alignment topRight', () async {
      final offset = getOffset(Alignment.topRight);
      expect(offset.dx, 80.9);
      expect(offset.dy, 19.1);
    });

    test('Custom alignment ', () async {
      final offset = getOffset(const Alignment(2, 2));
      expect(offset.dx, 100);
      expect(offset.dy, 100);
    });
  });

  group('DrawingUtils.drawBadgeShape', () {
    test('Instagram badge shape painter should match', () async {
      final getCustomPainter =
          DrawingUtils.drawBadgeShape(shape: badges.BadgeShape.instagram);
      expect(getCustomPainter.runtimeType, InstagramBadgeShapePainter);
    });

    test('Twitter badge shape painter should match', () async {
      final getCustomPainter =
          DrawingUtils.drawBadgeShape(shape: badges.BadgeShape.twitter);
      expect(getCustomPainter.runtimeType, TwitterBadgeShapePainter);
    });

    test('Circle badge shape painter should be null', () async {
      final getCustomPainter =
          DrawingUtils.drawBadgeShape(shape: badges.BadgeShape.circle);
      expect(getCustomPainter, null);
    });

    test('Square badge shape painter should be null', () async {
      final getCustomPainter =
          DrawingUtils.drawBadgeShape(shape: badges.BadgeShape.square);
      expect(getCustomPainter, null);
    });
  });

  group('Text size calculation', () {
    const text = 'H';
    const textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    test('Returns correct size for custom parameters', () {
      final size = CalculationUtils.calculateSizeOfText(text, textStyle);
      expect(size.width, 16);
      expect(size.height, 16);
    });

    test('Returns correct  size for empty text', () {
      final size = CalculationUtils.calculateSizeOfText('', textStyle);
      expect(size.width, 0);
      expect(size.height, 16);
    });

    test('Returns correct size for null style', () {
      final size = CalculationUtils.calculateSizeOfText(text, null);
      expect(size.width, 14);
      expect(size.height, 14);
    });
  });

  group('Content padding calculation', () {
    test('Padding in custom badge shape with text and null padding', () async {
      const badge = badges.Badge(
        badgeContent: Text('!'),
        badgeStyle: badges.BadgeStyle(shape: badges.BadgeShape.triangle),
      );
      final edgeInsets = CalculationUtils.calculateBadgeContentPadding(
        badge.badgeContent,
        badge.badgeStyle,
      ) as EdgeInsets;
      expect(edgeInsets.top, 5);
      expect(edgeInsets.bottom, 5);
      expect(edgeInsets.left, 5);
      expect(edgeInsets.right, 5);
    });
    test('Padding in custom badge shape with text and padding value', () async {
      const badge = badges.Badge(
        badgeContent: Icon(Icons.check, size: 10),
        badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.triangle,
            padding: EdgeInsets.only(left: 2, right: 4, top: 6, bottom: 8)),
      );
      final edgeInsets = CalculationUtils.calculateBadgeContentPadding(
        badge.badgeContent,
        badge.badgeStyle,
      ) as EdgeInsets;
      expect(edgeInsets.top, 8);
      expect(edgeInsets.bottom, 8);
      expect(edgeInsets.left, 8);
      expect(edgeInsets.right, 8);
    });

    test('Padding in default badge shape with text and null padding', () async {
      const badge = badges.Badge(
        badgeContent: Text('H'),
        badgeStyle: badges.BadgeStyle(shape: badges.BadgeShape.circle),
      );
      final edgeInsets = CalculationUtils.calculateBadgeContentPadding(
        badge.badgeContent,
        badge.badgeStyle,
      ) as EdgeInsets;
      expect(edgeInsets.top, 0);
      expect(edgeInsets.bottom, 0);
      expect(edgeInsets.left, 0);
      expect(edgeInsets.right, 0);
    });

    test('Padding in default badge shape with text and padding value',
        () async {
      const badge = badges.Badge(
        badgeContent: Text('H'),
        badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            padding: EdgeInsets.only(left: 1, right: 2, top: 3, bottom: 4)),
      );
      final edgeInsets = CalculationUtils.calculateBadgeContentPadding(
        badge.badgeContent,
        badge.badgeStyle,
      ) as EdgeInsets;
      expect(edgeInsets.top, 3);
      expect(edgeInsets.bottom, 4);
      expect(edgeInsets.left, 1);
      expect(edgeInsets.right, 2);
    });

    test('Padding in default badge shape with icon and padding value',
        () async {
      const badge = badges.Badge(
        badgeContent: Icon(Icons.add),
        badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            padding: EdgeInsets.only(left: 1, right: 2, top: 3, bottom: 4)),
      );
      final edgeInsets = CalculationUtils.calculateBadgeContentPadding(
        badge.badgeContent,
        badge.badgeStyle,
      ) as EdgeInsets;
      expect(edgeInsets.top, 3);
      expect(edgeInsets.bottom, 4);
      expect(edgeInsets.left, 1);
      expect(edgeInsets.right, 2);
    });

    test('Padding in default badge shape with icon and null padding ',
        () async {
      const badge = badges.Badge(
        badgeContent: Icon(Icons.add),
        badgeStyle: badges.BadgeStyle(shape: badges.BadgeShape.circle),
      );
      final edgeInsets = CalculationUtils.calculateBadgeContentPadding(
        badge.badgeContent,
        badge.badgeStyle,
      ) as EdgeInsets;
      expect(edgeInsets.top, 5);
      expect(edgeInsets.bottom, 5);
      expect(edgeInsets.left, 5);
      expect(edgeInsets.right, 5);
    });
  });
}
