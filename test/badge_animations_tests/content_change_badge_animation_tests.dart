import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/animation_test_utils.dart';

void contentChangeBadgeAnimationTests(
  BadgeAnimationType badgeAnimationType,
) {
  testWidgets('Content Change Badge Animation With Duration Test',
      (WidgetTester tester) async {
    String content = '1';
    final Badge badge = Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: const Duration(seconds: 2),
        appearanceDuration: const Duration(seconds: 1),
      ),
      onTap: () => content = '2',
      badgeContent: Text(content),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));
    BadgeState state = tester.state(find.byType(Badge));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    await tester.tap(find.text('1'));
    state.didUpdateWidget(
      Badge(
        badgeAnimation: AnimationTestUtils.getAnimationByType(
          badgeAnimationType: badgeAnimationType,
          animationDuration: const Duration(seconds: 2),
          appearanceDuration: const Duration(seconds: 1),
        ),
        onTap: () {},
        badgeContent: Text(content),
        child: const Text('child'),
      ),
    );

    await tester.pump();
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    expect(content, '2');
  });

  testWidgets('Content Change Badge Animation Without Duration Test ',
      (WidgetTester tester) async {
    String content = '1';
    final Badge badge = Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: Duration.zero,
        appearanceDuration: const Duration(seconds: 1),
      ),
      onTap: () => content = '2',
      badgeContent: Text(content),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));
    BadgeState state = tester.state(find.byType(Badge));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    await tester.tap(find.text('1'));
    state.didUpdateWidget(
      Badge(
        badgeAnimation: AnimationTestUtils.getAnimationByType(
          badgeAnimationType: badgeAnimationType,
          animationDuration: Duration.zero,
          appearanceDuration: const Duration(seconds: 1),
        ),
        onTap: () => content = '2',
        badgeContent: Text(content),
        child: const Text('child'),
      ),
    );

    await tester.pump();
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    expect(content, '2');
  });
}
