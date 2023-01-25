import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void opacityBadgeAnimationTests(badges.BadgeAnimationType badgeAnimationType) {
  if (badgeAnimationType != badges.BadgeAnimationType.fade) {
    testWidgets('Opacity Badge With Appearance Animation Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestWidgetScreen(
          toHideBadge: true,
          badgeAnimationType: badgeAnimationType,
          animationDuration: const Duration(seconds: 2),
          appearanceDuration: const Duration(seconds: 1),
          appearanceDisappearanceFadeAnimationEnabled: true,
        ),
      );

      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);

      final Opacity showedOpacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(showedOpacityWidget.opacity, 1.0);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);

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
      expect(hidOpacityWidget.opacity, 0.0);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);
    });
  }

  if (badgeAnimationType != badges.BadgeAnimationType.slide &&
      badgeAnimationType != badges.BadgeAnimationType.rotation) {
    testWidgets('Opacity Badge Without Appearance Animation Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestWidgetScreen(
          toHideBadge: true,
          badgeAnimationType: badgeAnimationType,
          animationDuration: const Duration(seconds: 2),
          appearanceDuration: const Duration(seconds: 1),
          appearanceDisappearanceFadeAnimationEnabled: false,
        ),
      );

      final Opacity startOpacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(startOpacityWidget.opacity, 1.0);

      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);

      final Opacity showedOpacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(showedOpacityWidget.opacity, 1.0);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);

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
      expect(hidOpacityWidget.opacity, 1.0);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);
    });
  }
}
