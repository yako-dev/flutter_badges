import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Badge tests', () {
    bool isPressed = false;
    final badge = Badge(
      badgeStyle: BadgeStyle(
        shape: BadgeShape.square,
        borderRadius: BorderRadius.circular(5),
        padding: const EdgeInsets.all(2),
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.yellow,
          ],
        ),
      ),
      position: BadgePosition.topEnd(top: -12, end: -20),
      animationType: BadgeAnimationType.scale,
      appearanceDuration: const Duration(milliseconds: 300),
      animationDuration: const Duration(milliseconds: 500),
      onTap: () {
        isPressed = true;
      },
      badgeContent: const Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: const Text(
        'MUSIC',
        style: TextStyle(),
      ),
    );

    testWidgets('Widget should render correctly', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.byType(Badge), findsOneWidget);
    });

    testWidgets('Badge content should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.text('NEW'), findsOneWidget);
    });

    testWidgets('Child should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.text('MUSIC'), findsOneWidget);
    });

    testWidgets('Badge default color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.badgeColor, Colors.red);
    });

    testWidgets('Badge gradient colors should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.gradient?.colors.first, Colors.blue);
      expect(badgeWidget.badgeStyle.gradient?.colors.last, Colors.yellow);
    });

    testWidgets('Badge with child onTap is called', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeFinder = find.descendant(
        of: find.byType(Badge),
        matching: find.byType(GestureDetector),
      );
      await tester.ensureVisible(badgeFinder);
      await tester.pumpAndSettle();
      await tester.tap(badgeFinder);

      expect(isPressed, true);
    });

    testWidgets('Badge animation type should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.animationType, BadgeAnimationType.scale);
    });

    testWidgets('Badge appearance duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.appearanceDuration, const Duration(milliseconds: 300));
    });

    testWidgets('Badge animation duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.animationDuration, const Duration(milliseconds: 500));
    });

    testWidgets('Badge shape should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.shape, BadgeShape.square);
    });

    testWidgets('Badge without child onTap is called', (tester) async {
      bool isPressed = false;
      final badgeWidget = Badge(
        badgeStyle: BadgeStyle(
          elevation: 0,
          shape: BadgeShape.circle,
          padding: const EdgeInsets.all(7),
        ),
        badgeContent: const Text('22'),
        onTap: () {
          isPressed = true;
        },
      );
      await tester.pumpWidget(_wrapWithMaterialApp(badgeWidget));

      await tester.ensureVisible(find.byType(Badge));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Badge));

      expect(isPressed, true);
    });
  });
}

Widget _wrapWithMaterialApp(Widget testWidget) {
  return MaterialApp(home: Scaffold(body: testWidget));
}
