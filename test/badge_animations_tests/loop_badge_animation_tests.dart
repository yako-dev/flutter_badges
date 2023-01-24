import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void loopBadgeAnimationTests(badges.BadgeAnimationType badgeAnimationType) {
  testWidgets('Loop Badge Animation With Duration Test ', (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        loopAnimation: true,
        toAnimate: true,
        animationDuration: const Duration(seconds: 2),
        appearanceDuration: const Duration(seconds: 1),
      ),
    );

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);

    await tester.tap(find.text('1'));

    await tester.pump();
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final badgeWidget = tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(badgeWidget.badgeStyle.badgeColor, Colors.red);
    expect(find.text('2'), findsOneWidget);

    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityWidget.opacity, 1.0);

    await tester.tap(find.text('2'));

    await tester.pump();
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);

    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('Loop Badge Animation Without Duration Test ', (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        loopAnimation: true,
        toAnimate: true,
        animationDuration: Duration.zero,
        appearanceDuration: Duration.zero,
      ),
    );

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    await tester.tap(find.text('1'));

    await tester.pump();
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final badgeWidget = tester.widget<badges.Badge>(find.byType(badges.Badge));
    expect(badgeWidget.badgeStyle.badgeColor, Colors.red);
    expect(find.text('2'), findsOneWidget);

    final Opacity updatedOpacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(updatedOpacityWidget.opacity, 1.0);

    await tester.tap(find.text('2'));

    await tester.pump();
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    expect(find.text('3'), findsOneWidget);
  });
}
