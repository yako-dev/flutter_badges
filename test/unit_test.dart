import 'package:badges/badges.dart';
import 'package:badges/src/painters/instagram_badge_shape_painter.dart';
import 'package:badges/src/painters/twitter_badge_shape_painter.dart';
import 'package:badges/src/utils/calculation_utils.dart';
import 'package:badges/src/utils/drawing_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculate Position testing', () {
    test('Test calculate Position a null value', () async {
      final position = CalculationUtils.calculatePosition(null);
      expect(position.top, 0);
      expect(position.end, 0);
    });

    test('Test calculate Position a BadgePosition with null values', () async {
      final position = CalculationUtils.calculatePosition(
        const BadgePosition(
          top: null,
          end: null,
          bottom: null,
          start: null,
        ),
      );
      expect(position.top, null);
      expect(position.end, null);
      expect(position.bottom, null);
      expect(position.start, null);
    });

    test('Test calculate Position a BadgePosition with negative values',
        () async {
      final position = CalculationUtils.calculatePosition(const BadgePosition(
        top: -10,
        end: -10,
        bottom: -10,
        start: -10,
      ));
      expect(position.top, 0);
      expect(position.end, 0);
      expect(position.bottom, 0);
      expect(position.start, 0);
    });

    test('Test calculate Position a BadgePosition with normal values',
        () async {
      final position = CalculationUtils.calculatePosition(
        const BadgePosition(
          top: 15,
          end: 15,
          bottom: 15,
          start: 15,
        ),
      );
      expect(position.top, 15);
      expect(position.end, 15);
      expect(position.bottom, 15);
      expect(position.start, 15);
    });
  });

  group('Calculate Padding testing', () {
    test('Test calculate Padding with a null value', () async {
      final padding = CalculationUtils.calculatePadding(null);
      expect(padding.top, 8);
      expect(padding.right, 10);
      expect(padding.bottom, 0);
      expect(padding.left, 0);
    });

    test('Test calculate Padding a BadgePosition with isCenter = true',
        () async {
      final padding = CalculationUtils.calculatePadding(
        const BadgePosition(
          isCenter: true,
          top: -10,
          end: 20,
        ),
      );
      expect(padding.top, 0);
      expect(padding.right, 0);
    });

    test('Test calculate Padding a BadgePosition with null values', () async {
      final padding = CalculationUtils.calculatePadding(
        const BadgePosition(
          top: null,
          end: null,
          bottom: null,
          start: null,
        ),
      );
      expect(padding.top, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 0);
      expect(padding.right, 0);
    });

    test('Test calculate Padding a BadgePosition with top and start values',
        () async {
      final padding = CalculationUtils.calculatePadding(
        const BadgePosition(
          top: -5,
          end: -5,
          bottom: -5,
          start: -5,
        ),
      );
      expect(padding.top, 5);
      expect(padding.left, 5);
      expect(padding.bottom, 0);
      expect(padding.right, 0);
    });

    test(
        'Test calculate Padding a BadgePosition without top and start values'
        'and negative end bottom values', () async {
      final padding = CalculationUtils.calculatePadding(
        const BadgePosition(
          end: -5,
          bottom: -5,
        ),
      );
      expect(padding.top, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 5);
      expect(padding.right, 5);
    });

    test(
        'Test calculate Padding a BadgePosition without top and start values'
        'and normal end bottom values', () async {
      final padding = CalculationUtils.calculatePadding(
        const BadgePosition(
          end: 5,
          bottom: 5,
        ),
      );
      expect(padding.top, 0);
      expect(padding.left, 0);
      expect(padding.bottom, 0);
      expect(padding.right, 0);
    });
  });

  group('Calculate Offset with Alignment tests', () {
    Offset getOffset(AlignmentGeometry alignment) {
      return CalculationUtils.calculateOffset(
        alignment: alignment,
        width: 100,
        height: 100,
      );
    }

    test('Test calculate position with alignment topLeft', () async {
      final offset = getOffset(Alignment.topLeft);
      expect(offset.dx, 19.1);
      expect(offset.dy, 19.1);
    });

    test('Test calculate position with alignment center', () async {
      final offset = getOffset(Alignment.center);
      expect(offset.dx, 50);
      expect(offset.dy, 50);
    });

    test('Test calculate position with alignment bottomRight', () async {
      final offset = getOffset(Alignment.bottomRight);
      expect(offset.dx, 80.9);
      expect(offset.dy, 80.9);
    });

    test('Test calculate position with alignment centerLeft', () async {
      final offset = getOffset(Alignment.centerLeft);
      expect(offset.dx, 6);
      expect(offset.dy, 50);
    });

    test('Test calculate position with alignment bottomCenter', () async {
      final offset = getOffset(Alignment.bottomCenter);
      expect(offset.dx, 50);
      expect(offset.dy, 94);
    });

    test('Test calculate position with alignment bottomLeft', () async {
      final offset = getOffset(Alignment.bottomLeft);
      expect(offset.dx, 19.1);
      expect(offset.dy, 80.9);
    });

    test('Test calculate position with alignment centerRight', () async {
      final offset = getOffset(Alignment.centerRight);
      expect(offset.dx, 94);
      expect(offset.dy, 50);
    });

    test('Test calculate position with alignment topCenter', () async {
      final offset = getOffset(Alignment.topCenter);
      expect(offset.dx, 50);
      expect(offset.dy, 6);
    });

    test('Test calculate position with alignment topRight', () async {
      final offset = getOffset(Alignment.topRight);
      expect(offset.dx, 80.9);
      expect(offset.dy, 19.1);
    });

    test('Test calculate position with custom alignment ', () async {
      final offset = getOffset(const Alignment(2, 2));
      expect(offset.dx, 100);
      expect(offset.dy, 100);
    });
  });

  group('Drawing utils tests', () {
    test('Instagram badge shape painter should match', () async {
      final getCustomPainter = DrawingUtils.drawBadgeShape(
        shape: BadgeShape.instagram,
      );
      expect(getCustomPainter.runtimeType, InstagramBadgeShapePainter);
    });

    test('Twitter badge shape painter should match', () async {
      final getCustomPainter = DrawingUtils.drawBadgeShape(
        shape: BadgeShape.twitter,
      );
      expect(getCustomPainter.runtimeType, TwitterBadgeShapePainter);
    });

    test('Circle badge shape painter should match', () async {
      final getCustomPainter = DrawingUtils.drawBadgeShape(
        shape: BadgeShape.circle,
      );
      expect(getCustomPainter, null);
    });

    test('Square badge shape painter should match', () async {
      final getCustomPainter = DrawingUtils.drawBadgeShape(
        shape: BadgeShape.square,
      );
      expect(getCustomPainter, null);
    });
  });
}
