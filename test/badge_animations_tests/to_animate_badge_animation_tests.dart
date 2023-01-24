import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void toAnimateBadgeAnimationTest(badges.BadgeAnimationType badgeAnimationType) {
  testWidgets('To Animate Badge Animation Test ', (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        badgeAnimationType: badgeAnimationType,
        toAnimate: false,
        colorChangeDuration: const Duration(seconds: 2),
        animationDuration: const Duration(seconds: 2),
        appearanceDuration: const Duration(seconds: 2),
        toHideBadge: true,
      ),
    );

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(badges.Badge),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityWidget.opacity, 1.0);

    await tester.tap(find.text('1'));

    await tester.pump();
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
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
    expect(updatedOpacityWidget.opacity, 0.0);
  });
}
