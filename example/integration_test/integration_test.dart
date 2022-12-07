import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const duration = Duration(seconds: 2);

  group('Integration tests of Test Screen', () {
    testWidgets('Integration tests of Test Screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pump(duration);

      /// Circle Badge with size animation test
      expect(find.byKey(Key('CircleBadge')), findsOneWidget);
      final badgeStates = tester.allStates
          .where((element) => element.runtimeType == BadgeState)
          .toList();
      final state = badgeStates[0] as BadgeState;

      final opacityFinder = find.descendant(
          of: find.byKey(Key('CircleBadge')), matching: find.byType(Opacity));
      final opacityWidget = tester.widget<Opacity>(opacityFinder);

      expect(state.getAppearanceController().value, 0.0);
      expect(opacityWidget.opacity, state.getAppearanceController().value);
      expect(state.getAnimationController().value, 0.0);

      await tester.tap(find.text('Circle size animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final showedOpacityWidget = tester.widget<Opacity>(opacityFinder);
      expect(state.getAppearanceController().value, 1.0);
      expect(
          showedOpacityWidget.opacity, state.getAppearanceController().value);
      expect(state.getAnimationController().value, 1.0);
      expect(find.text('circle'), findsOneWidget);

      await tester.tap(find.text('Circle size animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final hiddenOpacityWidget = tester.widget<Opacity>(opacityFinder);
      expect(state.getAppearanceController().value, 0.0);
      expect(
          hiddenOpacityWidget.opacity, state.getAppearanceController().value);
      expect(state.getAnimationController().value, 0.0);

      /// Square Badge with fade animation test
      expect(find.byKey(Key('SquareBadge')), findsOneWidget);
      final squareState = badgeStates[1] as BadgeState;

      final squareOpacityFinder = find.descendant(
          of: find.byKey(Key('SquareBadge')), matching: find.byType(Opacity));
      final squareOpacityWidget = tester.widget<Opacity>(squareOpacityFinder);

      expect(squareOpacityWidget.opacity, 1.0);
      expect(squareState.getAnimationController().value, 0.0);

      await tester.tap(find.text('Square fade animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final squareShowedOpacityWidget =
          tester.widget<Opacity>(squareOpacityFinder);
      expect(squareShowedOpacityWidget.opacity, 1.0);
      expect(squareState.getAnimationController().value, 1.0);
      expect(find.text('1111'), findsOneWidget);

      await tester.tap(find.text('Square fade animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final squareHiddenOpacityWidget =
          tester.widget<Opacity>(squareOpacityFinder);
      expect(squareHiddenOpacityWidget.opacity, 1.0);
      expect(squareState.getAnimationController().value, 0.0);

      /// Twitter Badge with rotation animation test

      expect(find.byKey(Key('TwitterBadge')), findsOneWidget);
      final twitterState = badgeStates[2] as BadgeState;

      final twitterOpacityFinder = find.descendant(
          of: find.byKey(Key('TwitterBadge')), matching: find.byType(Opacity));
      final twitterOpacityWidget = tester.widget<Opacity>(twitterOpacityFinder);

      expect(twitterState.getAppearanceController().value, 0.0);
      expect(twitterOpacityWidget.opacity,
          twitterState.getAppearanceController().value);
      expect(twitterState.getAnimationController().value, 0.0);

      await tester.tap(find.text('Twitter rotation animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final twitterShowedOpacityWidget =
          tester.widget<Opacity>(twitterOpacityFinder);
      expect(twitterState.getAppearanceController().value, 1.0);
      expect(twitterShowedOpacityWidget.opacity,
          twitterState.getAppearanceController().value);
      expect(twitterState.getAnimationController().value, 1.0);
      expect(find.byIcon(Icons.check), findsOneWidget);

      await tester.tap(find.text('Twitter rotation animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final twitterHiddenOpacityWidget =
          tester.widget<Opacity>(twitterOpacityFinder);
      expect(twitterState.getAppearanceController().value, 0.0);
      expect(twitterHiddenOpacityWidget.opacity,
          twitterState.getAppearanceController().value);
      expect(twitterState.getAnimationController().value, 0.0);

      /// Instagram Badge with scale animation test

      expect(find.byKey(Key('InstagramBadge')), findsOneWidget);
      final instagramState = badgeStates[3] as BadgeState;

      final instagramOpacityFinder = find.descendant(
          of: find.byKey(Key('InstagramBadge')),
          matching: find.byType(Opacity));
      final instagramOpacityWidget =
          tester.widget<Opacity>(instagramOpacityFinder);

      expect(instagramState.getAppearanceController().value, 0.0);
      expect(instagramOpacityWidget.opacity,
          instagramState.getAppearanceController().value);
      expect(instagramState.getAnimationController().value, 0.0);

      await tester.tap(find.text('Instagram scale animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final instagramShowedOpacityWidget =
          tester.widget<Opacity>(instagramOpacityFinder);
      expect(instagramState.getAppearanceController().value, 1.0);
      expect(instagramShowedOpacityWidget.opacity,
          instagramState.getAppearanceController().value);
      expect(instagramState.getAnimationController().value, 1.0);
      expect(find.byIcon(Icons.camera), findsOneWidget);

      await tester.tap(find.text('Instagram scale animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final instagramHideOpacityWidget = tester.widget<Opacity>(opacityFinder);
      expect(instagramState.getAppearanceController().value, 0.0);
      expect(instagramHideOpacityWidget.opacity,
          instagramState.getAppearanceController().value);
      expect(instagramState.getAnimationController().value, 0.0);

      /// Badge change color animation test

      expect(find.byKey(Key('ChangeColorBadge')), findsOneWidget);
      final changeColorState = badgeStates[4] as BadgeState;

      final changeColorOpacityFinder = find.descendant(
          of: find.byKey(Key('ChangeColorBadge')),
          matching: find.byType(Opacity));
      final changeColorOpacityWidget =
          tester.widget<Opacity>(changeColorOpacityFinder);

      final changeColorBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeColorBadge')));

      expect(changeColorBadgeWidget.badgeStyle.badgeColor, Colors.purple);
      expect(changeColorOpacityWidget.opacity, 1.0);
      expect(changeColorState.getAnimationController().value, 1.0);

      await tester.tap(find.text('Change badge color animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final changeColorShowedOpacityWidget =
          tester.widget<Opacity>(changeColorOpacityFinder);

      final orangeBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeColorBadge')));
      expect(orangeBadgeWidget.badgeStyle.badgeColor, Colors.orange);
      expect(changeColorShowedOpacityWidget.opacity, 1.0);
      expect(changeColorState.getAnimationController().value, 1.0);

      await tester.tap(find.text('Change badge color animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final changeColorHideOpacityWidget =
          tester.widget<Opacity>(changeColorOpacityFinder);

      final purpleBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeColorBadge')));
      expect(purpleBadgeWidget.badgeStyle.badgeColor, Colors.purple);
      expect(changeColorHideOpacityWidget.opacity, 1.0);
      expect(changeColorState.getAnimationController().value, 1.0);

      /// Badge change color animation test

      expect(find.byKey(Key('ChangeIconBadge')), findsOneWidget);
      final changeIconState = badgeStates[5] as BadgeState;

      final changeIconBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeIconBadge')));
      final badgeContentIcon = changeIconBadgeWidget.badgeContent as Icon;

      expect(badgeContentIcon.icon, Icons.account_balance_rounded);
      expect(changeIconState.getAnimationController().value, 1.0);

      await tester.tap(find.text('Change badge icon animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      expect(changeIconState.getAnimationController().value, 0.0);

      await tester.tap(find.text('Change badge icon animation'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final changeIconUpdatedBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeIconBadge')));
      final updatedBadgeContentIcon =
          changeIconUpdatedBadgeWidget.badgeContent as Icon;

      expect(updatedBadgeContentIcon.icon, Icons.add);
      expect(changeIconState.getAnimationController().value, 1.0);

      /// Badge change amount animation tests

      expect(find.byKey(Key('ChangeAmountBadge')), findsOneWidget);

      final changeAmountState = badgeStates[6] as BadgeState;

      final nonVisibleBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeAmountBadge')));

      expect(nonVisibleBadgeWidget.showBadge, false);
      expect(changeAmountState.getAnimationController().value, 0.0);

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final amountBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeAmountBadge')));
      final amountContent = amountBadgeWidget.badgeContent as Text;

      expect(amountContent.data, '1');
      expect(amountBadgeWidget.showBadge, true);
      expect(changeAmountState.getAnimationController().value, 1.0);

      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();
      await tester.pump(duration);

      final updatedAmountBadgeWidget =
          tester.widget<Badge>(find.byKey(Key('ChangeAmountBadge')));

      expect(updatedAmountBadgeWidget.showBadge, false);
      expect(changeAmountState.getAnimationController().value, 0.0);
    });
  });
}
