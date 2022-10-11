import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Badge tests', () {
    final badge = Badge(
      shape: BadgeShape.square,
      borderRadius: BorderRadius.circular(5),
      position: BadgePosition.topEnd(top: -12, end: -20),
      padding: EdgeInsets.all(2),
      gradient: LinearGradient(
        colors: [
          Colors.blue,
          Colors.yellow,
        ],
      ),
      onTap: () {},
      badgeContent: Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(
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
      expect(badgeWidget.badgeColor, Colors.red);
    });

    testWidgets('Badge gradient colors should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.gradient?.colors.first, Colors.blue);
      expect(badgeWidget.gradient?.colors.last, Colors.yellow);
    });
  });
}

Widget _wrapWithMaterialApp(Widget testWidget) {
  return MaterialApp(home: testWidget);
}
