import 'package:badges/badges.dart';
import 'package:example/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Integration tests of Test Screen', () {
    group('Circle Badge with size animation test', () {
      testWidgets('Circle Badge with size animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        expect(find.byKey(Key('CircleBadge')), findsOneWidget);
        final badgeState = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .first as BadgeState;

        final opacityFinder = find.descendant(
            of: find.byKey(Key('CircleBadge')), matching: find.byType(Opacity));
        final opacityWidget = tester.widget<Opacity>(opacityFinder);

        expect(badgeState.getAppearanceController().value, 0.0);
        expect(
            opacityWidget.opacity, badgeState.getAppearanceController().value);
        expect(badgeState.getAnimationController().value, 0.0);

        await tester.tap(find.text('Circle size animation'));
        await tester.pumpAndSettle();

        final showedOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(badgeState.getAppearanceController().value, 1.0);
        expect(showedOpacityWidget.opacity,
            badgeState.getAppearanceController().value);
        expect(badgeState.getAnimationController().value, 1.0);
        expect(find.text('circle'), findsOneWidget);

        await tester.tap(find.text('Circle size animation'));
        await tester.pumpAndSettle();
        final hiddenOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(badgeState.getAppearanceController().value, 0.0);
        expect(hiddenOpacityWidget.opacity,
            badgeState.getAppearanceController().value);
        expect(badgeState.getAnimationController().value, 0.0);
      });
    });

    group('Square Badge with fade animation test', () {
      testWidgets('Square Badge with fade animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        expect(find.byKey(Key('SquareBadge')), findsOneWidget);
        final badgeStates = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .toList();
        final state = badgeStates[1] as BadgeState;

        final opacityFinder = find.descendant(
            of: find.byKey(Key('SquareBadge')), matching: find.byType(Opacity));
        final opacityWidget = tester.widget<Opacity>(opacityFinder);

        expect(opacityWidget.opacity, 1.0);
        expect(state.getAnimationController().value, 0.0);

        await tester.tap(find.text('Square fade animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final showedOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(showedOpacityWidget.opacity, 1.0);
        expect(state.getAnimationController().value, 1.0);
        expect(find.text('1111'), findsOneWidget);

        await tester.tap(find.text('Square fade animation'));
        await tester.pumpAndSettle();
        final hiddenOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(hiddenOpacityWidget.opacity, 1.0);
        expect(state.getAnimationController().value, 0.0);
      });
    });

    group('Twitter Badge with rotation animation test', () {
      testWidgets('Twitter Badge with rotation animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        expect(find.byKey(Key('TwitterBadge')), findsOneWidget);
        final badgeStates = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .toList();
        final state = badgeStates[2] as BadgeState;

        final opacityFinder = find.descendant(
            of: find.byKey(Key('TwitterBadge')),
            matching: find.byType(Opacity));
        final opacityWidget = tester.widget<Opacity>(opacityFinder);

        expect(state.getAppearanceController().value, 0.0);
        expect(opacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 0.0);

        await tester.tap(find.text('Twitter rotation animation'));
        await tester.pumpAndSettle(Duration(seconds: 10));
        await tester.pump();

        final showedOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(state.getAppearanceController().value, 1.0);
        expect(showedOpacityWidget.opacity,
            1.0 /*badgeState.getAppearanceController().value*/);
        expect(state.getAnimationController().value, 1.0);
        expect(find.byIcon(Icons.check), findsOneWidget);

        await tester.tap(find.text('Twitter rotation animation'));
        await tester.pumpAndSettle();

        final hiddenOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(state.getAppearanceController().value, 0.0);
        expect(
            hiddenOpacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 0.0);
      });
    });

    group('Instagram Badge with scale animation test', () {
      testWidgets('Instagram Badge with scale animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        expect(find.byKey(Key('InstagramBadge')), findsOneWidget);
        final badgeStates = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .toList();
        final state = badgeStates[3] as BadgeState;

        final opacityFinder = find.descendant(
            of: find.byKey(Key('InstagramBadge')),
            matching: find.byType(Opacity));
        final opacityWidget = tester.widget<Opacity>(opacityFinder);

        expect(state.getAppearanceController().value, 0.0);
        expect(opacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 0.0);

        await tester.tap(find.text('Instagram scale animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final showedOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(state.getAppearanceController().value, 1.0);
        expect(
            showedOpacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 1.0);
        expect(find.byIcon(Icons.camera), findsOneWidget);

        await tester.tap(find.text('Instagram scale animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final hideOpacityWidget = tester.widget<Opacity>(opacityFinder);
        expect(state.getAppearanceController().value, 0.0);
        expect(
            hideOpacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 0.0);
      });
    });

    group('Badge change color animation test', () {
      testWidgets('Badge change color animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        expect(find.byKey(Key('ChangeColorBadge')), findsOneWidget);
        final badgeStates = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .toList();
        final state = badgeStates[4] as BadgeState;

        final opacityFinder = find.descendant(
            of: find.byKey(Key('ChangeColorBadge')),
            matching: find.byType(Opacity));
        final opacityWidget = tester.widget<Opacity>(opacityFinder);

        final badgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeColorBadge')));
        expect(badgeWidget.badgeStyle.badgeColor, Colors.purple);
        expect(state.getAppearanceController().value, 0.0);
        expect(opacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 0.0);

        await tester.tap(find.text('Change badge color animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final showedOpacityWidget = tester.widget<Opacity>(opacityFinder);

        final orangeBadgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeColorBadge')));
        expect(orangeBadgeWidget.badgeStyle.badgeColor, Colors.orange);
        expect(state.getAppearanceController().value, 1.0);
        expect(
            showedOpacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 1.0);

        await tester.tap(find.text('Change badge color animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final hideOpacityWidget = tester.widget<Opacity>(opacityFinder);
        final purpleBadgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeColorBadge')));
        expect(purpleBadgeWidget.badgeStyle.badgeColor, Colors.purple);
        expect(state.getAppearanceController().value, 1.0);
        expect(
            hideOpacityWidget.opacity, state.getAppearanceController().value);
        expect(state.getAnimationController().value, 1.0);
      });
    });

    group('Badge change icon animation test', () {
      testWidgets('Badge change icon animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        await tester.pumpAndSettle(Duration(milliseconds: 500));
        expect(find.byKey(Key('ChangeIconBadge')), findsOneWidget);
        final badgeStates = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .toList();
        final state = badgeStates[5] as BadgeState;

        final badgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeIconBadge')));
        final childIcon = badgeWidget.badgeContent as Icon;

        expect(childIcon.icon, Icons.account_balance_rounded);
        expect(state.getAnimationController().value, 1.0);

        await tester.tap(find.text('Change badge icon animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        expect(state.getAnimationController().value, 0.0);

        await tester.tap(find.text('Change badge icon animation'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final updatedBadgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeIconBadge')));
        final updatedChildIcon = updatedBadgeWidget.badgeContent as Icon;

        expect(updatedChildIcon.icon, Icons.add);
        expect(state.getAnimationController().value, 1.0);
      });
    });

    group('Badge change amount animation tests', () {
      testWidgets('Badge change icon animation test', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestScreen()));
        await tester.pumpAndSettle(Duration(milliseconds: 500));
        expect(find.byKey(Key('ChangeAmountBadge')), findsOneWidget);

        final badgeStates = tester.allStates
            .where((element) => element.runtimeType == BadgeState)
            .toList();
        final state = badgeStates[6] as BadgeState;

        final nonVisibleBadgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeAmountBadge')));

        expect(nonVisibleBadgeWidget.showBadge, false);
        expect(state.getAnimationController().value, 0.0);

        await tester.tap(find.text('Add'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final amountBadgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeAmountBadge')));
        final amountContent = amountBadgeWidget.badgeContent as Text;

        expect(amountContent.data, '1');
        expect(amountBadgeWidget.showBadge, true);
        expect(state.getAnimationController().value, 1.0);

        await tester.tap(find.text('Remove'));
        await tester.pumpAndSettle(Duration(milliseconds: 500));

        final updatedAmountBadgeWidget =
            tester.widget<Badge>(find.byKey(Key('ChangeAmountBadge')));

        expect(updatedAmountBadgeWidget.showBadge, false);
        expect(state.getAnimationController().value, 0.0);
      });
    });
  });
}
