import 'package:badges/badges.dart' as badges;
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

// Tests that verify the animation re-triggers when badgeContent changes.
// Uses TestWidgetScreen which calls setState on tap, causing the framework
// to rebuild the widget and call BadgeState.didUpdateWidget naturally.
void contentChangeBadgeAnimationTests(
  badges.BadgeAnimationType badgeAnimationType,
) {
  testWidgets(
    'Content change re-triggers animation when animationDuration > 0',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        TestWidgetScreen(
          badgeAnimationType: badgeAnimationType,
          animationDuration: const Duration(seconds: 2),
          appearanceDuration: const Duration(seconds: 1),
          toChangeContent: true,
        ),
      );

      // Wait for the initial appearance animation to finish
      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);
      expect(find.text('1'), findsOneWidget);

      // Tap triggers setState → widget rebuilds with new content →
      // framework calls didUpdateWidget → animation controller resets and plays
      await tester.tap(find.text('1'));
      await tester.pump();

      expect(tester.hasRunningAnimations, true);
      expect(find.text('2'), findsOneWidget);

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);
    },
  );

  testWidgets(
    'Content change does not trigger animation when animationDuration is zero',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        TestWidgetScreen(
          badgeAnimationType: badgeAnimationType,
          animationDuration: Duration.zero,
          appearanceDuration: const Duration(seconds: 1),
          toChangeContent: true,
        ),
      );

      // Wait for the initial appearance animation to finish
      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);
      expect(find.text('1'), findsOneWidget);

      await tester.tap(find.text('1'));
      await tester.pump();

      // Zero-duration animation completes immediately — no running animations
      expect(tester.hasRunningAnimations, false);
      expect(find.text('2'), findsOneWidget);
    },
  );
}
