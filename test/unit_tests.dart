import 'package:badges/badges.dart';
import 'package:badges/src/utils/calculation_utils.dart';
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
}
