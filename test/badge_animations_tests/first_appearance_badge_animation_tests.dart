import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/animation_test_utils.dart';

void firstAppearanceBadgeAnimationTests(
    badges.BadgeAnimationType badgeAnimationType) {
  testWidgets('First Appearance Badge Animation Without Durations Test',
      (WidgetTester tester) async {
    final badges.Badge badge = badges.Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: Duration.zero,
        appearanceDuration: Duration.zero,
      ),
      badgeContent: const Text('1'),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets(
      'First Appearance Badge Animation Without Appearance Duration Test',
      (WidgetTester tester) async {
    final badges.Badge badge = badges.Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: const Duration(seconds: 1),
        appearanceDuration: Duration.zero,
      ),
      badgeContent: const Text('1'),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets(
      'First Appearance Badge Animation Without Animation Duration Test',
      (WidgetTester tester) async {
    final badges.Badge badge = badges.Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: Duration.zero,
        appearanceDuration: const Duration(seconds: 1),
      ),
      badgeContent: const Text('1'),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets(
      'First Appearance Badge Animation With Different Animation Duration Test',
      (WidgetTester tester) async {
    final badges.Badge badge = badges.Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: const Duration(seconds: 2),
        appearanceDuration: const Duration(seconds: 1),
      ),
      badgeContent: const Text('1'),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets(
      'First Appearance Badge Animation With Different Appearance Duration Test',
      (WidgetTester tester) async {
    final badges.Badge badge = badges.Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: const Duration(seconds: 1),
        appearanceDuration: const Duration(seconds: 2),
      ),
      badgeContent: const Text('1'),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });

  testWidgets('First Appearance Badge Animation With Same Duration Test',
      (WidgetTester tester) async {
    final badges.Badge badge = badges.Badge(
      badgeAnimation: AnimationTestUtils.getAnimationByType(
        badgeAnimationType: badgeAnimationType,
        animationDuration: const Duration(seconds: 1),
        appearanceDuration: const Duration(seconds: 1),
      ),
      badgeContent: const Text('1'),
      child: const Text('child'),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: badge)));

    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, true);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
  });
}
