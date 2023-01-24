import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void colorChangeBadgeAnimationTests(
    badges.BadgeAnimationType badgeAnimationType) {
  testWidgets('Change Color Badge Animation With Duration Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        colorChangeDuration: const Duration(seconds: 1),
        badgeAnimationType: badgeAnimationType,
        animationDuration: Duration.zero,
        appearanceDuration: Duration.zero,
      ),
    );

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final badgeWidget = tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(badgeWidget.badgeStyle.badgeColor, Colors.blue);

    await tester.tap(find.text('1'));

    await tester.pump();
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final updatedBadgeWidget =
        tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(updatedBadgeWidget.badgeStyle.badgeColor, Colors.red);
  });

  testWidgets('Change Color Badge Animation Without Duration Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        colorChangeDuration: Duration.zero,
        badgeAnimationType: badgeAnimationType,
        animationDuration: Duration.zero,
        appearanceDuration: Duration.zero,
      ),
    );

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final badgeWidget = tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(badgeWidget.badgeStyle.badgeColor, Colors.blue);

    await tester.tap(find.text('1'));

    await tester.pump();
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final updateBadgeWidget =
        tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(updateBadgeWidget.badgeStyle.badgeColor, Colors.red);
  });

  testWidgets('Change Color Badge Animation Without Badge Animation Test',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        colorChangeDuration: const Duration(seconds: 1),
        badgeAnimationType: badgeAnimationType,
        animationDuration: Duration.zero,
        appearanceDuration: const Duration(seconds: 2),
        toChangeContent: false,
      ),
    );

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final badgeWidget = tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(badgeWidget.badgeStyle.badgeColor, Colors.blue);

    await tester.tap(find.text('1'));

    await tester.pump();
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final updateBadgeWidget =
        tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(updateBadgeWidget.badgeStyle.badgeColor, Colors.red);
  });
}
