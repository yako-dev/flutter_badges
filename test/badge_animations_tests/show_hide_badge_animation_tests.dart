import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void showHideBadgeAnimationTests(badges.BadgeAnimationType badgeAnimationType) {
  testWidgets('Show hide Badge Animation With Different Duration Test ',
      (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        toAnimate: true,
        toHideBadge: true,
        animationDuration: const Duration(seconds: 2),
        appearanceDuration: const Duration(seconds: 1),
      ),
    );

    // Showing Badge
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);

    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityWidget.opacity, 1.0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    // Hiding Badge
    await tester.tap(find.text('1'));

    await tester.pump();

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);

    final Opacity hidOpacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    if (badgeAnimationType == badges.BadgeAnimationType.fade) {
      expect(hidOpacityWidget.opacity, 1.0);
    } else {
      expect(hidOpacityWidget.opacity, 0.0);
    }

    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets('Show hide Badge Animation With Different Duration Test ',
      (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        toAnimate: true,
        toHideBadge: true,
        animationDuration: const Duration(seconds: 1),
        appearanceDuration: const Duration(seconds: 2),
      ),
    );

    // Showing Badge
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityWidget.opacity, 1.0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    // Hiding Badge
    await tester.tap(find.text('1'));

    await tester.pump();

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    final Opacity hidOpacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    if (badgeAnimationType == badges.BadgeAnimationType.fade) {
      expect(hidOpacityWidget.opacity, 1.0);
    } else {
      expect(hidOpacityWidget.opacity, 0.0);
    }
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets('Show hide Badge Animation Without Appearance Duration Test ',
      (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        toAnimate: true,
        toHideBadge: true,
        animationDuration: const Duration(seconds: 1),
        appearanceDuration: Duration.zero,
      ),
    );

    // Showing Badge
    expect(tester.hasRunningAnimations, true);
    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityWidget.opacity, 1.0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    // Hiding Badge
    await tester.tap(find.text('1'));

    await tester.pump();

    expect(tester.hasRunningAnimations, true);
    final Opacity hidOpacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    if (badgeAnimationType == badges.BadgeAnimationType.fade) {
      expect(hidOpacityWidget.opacity, 1.0);
    } else {
      expect(hidOpacityWidget.opacity, 0.0);
    }
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets('Show hide Badge Animation Without Animation Duration Test ',
      (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        toAnimate: true,
        toHideBadge: true,
        animationDuration: Duration.zero,
        appearanceDuration: const Duration(seconds: 1),
      ),
    );

    // Showing Badge
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityWidget.opacity, 1.0);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    // Hiding Badge
    await tester.tap(find.text('1'));

    await tester.pump();

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    final Opacity hidOpacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    if (badgeAnimationType == badges.BadgeAnimationType.fade) {
      expect(hidOpacityWidget.opacity, 1.0);
    } else {
      expect(hidOpacityWidget.opacity, 0.0);
    }
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });
}
