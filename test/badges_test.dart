import 'package:badges/badges.dart';
import 'package:badges/src/badge_border_gradient.dart';
import 'package:badges/src/badge_gradient_type.dart';
import 'package:badges/src/painters/instagram_badge_shape_painter.dart';
import 'package:badges/src/painters/twitter_badge_shape_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'badge_animations_tests/color_change_badge_animation_tests.dart';
import 'badge_animations_tests/content_change_badge_animation_tests.dart';
import 'badge_animations_tests/first_appearance_badge_animation_tests.dart';
import 'badge_animations_tests/loop_badge_animation_tests.dart';
import 'badge_animations_tests/opacity_badge_animation_tests.dart';
import 'badge_animations_tests/show_hide_badge_animation_tests.dart';
import 'badge_animations_tests/to_animate_badge_animation_test.dart';
import 'test_widget_screen.dart';

void main() {
  group('Badge Position tests', () {
    Widget getBadge(BadgePosition position) {
      return Badge(
        badgeContent: const Text('test'),
        position: position,
      );
    }

    testWidgets('Badge Position topEnd should match', (tester) async {
      BadgePosition position = BadgePosition.topEnd();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position center should match', (tester) async {
      BadgePosition position = BadgePosition.center();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position bottomEnd should match', (tester) async {
      BadgePosition position = BadgePosition.bottomEnd();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position bottomStart should match', (tester) async {
      BadgePosition position = BadgePosition.bottomStart();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position topStart should match', (tester) async {
      BadgePosition position = BadgePosition.topStart();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.position, position);
    });
  });

  group('Badge Gradient tests', () {
    Widget getBadgeGradient(BadgeGradient gradient) {
      return Badge(
          badgeStyle: BadgeStyle(
            shape: BadgeShape.square,
            badgeGradient: gradient,
          ),
          position: BadgePosition.topEnd(top: -12, end: -20),
          badgeContent: const Text('NEW'));
    }

    testWidgets('Badge Linear Gradient should match', (tester) async {
      BadgeGradient gradient = const BadgeGradient.linear(
        colors: [Colors.purple, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(getBadgeGradient(gradient)));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.badgeGradient?.gradientType,
          BadgeGradientType.linear);
      expect(badgeWidget.badgeStyle.badgeGradient?.colors.first, Colors.purple);
      expect(badgeWidget.badgeStyle.badgeGradient?.colors.last, Colors.blue);
      expect(badgeWidget.badgeStyle.badgeGradient?.begin, Alignment.topLeft);
      expect(badgeWidget.badgeStyle.badgeGradient?.end, Alignment.bottomRight);
      expect(badgeWidget.badgeStyle.badgeGradient?.stops, null);
      expect(badgeWidget.badgeStyle.badgeGradient?.transform, null);
      expect(badgeWidget.badgeStyle.badgeGradient?.tileMode, TileMode.clamp);
    });

    testWidgets('Badge Radial Gradient should match', (tester) async {
      BadgeGradient gradient = const BadgeGradient.radial(
        colors: [Colors.purple, Colors.blue],
        center: Alignment.center,
        radius: 5,
        focal: Alignment.topRight,
        focalRadius: 1,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(getBadgeGradient(gradient)));
      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.badgeGradient?.gradientType,
          BadgeGradientType.radial);
      expect(badgeWidget.badgeStyle.badgeGradient?.colors.first, Colors.purple);
      expect(badgeWidget.badgeStyle.badgeGradient?.colors.last, Colors.blue);
      expect(badgeWidget.badgeStyle.badgeGradient?.center, Alignment.center);
      expect(badgeWidget.badgeStyle.badgeGradient?.focal, Alignment.topRight);
      expect(badgeWidget.badgeStyle.badgeGradient?.stops, null);
      expect(badgeWidget.badgeStyle.badgeGradient?.transform, null);
      expect(badgeWidget.badgeStyle.badgeGradient?.tileMode, TileMode.clamp);
      expect(badgeWidget.badgeStyle.badgeGradient?.radius, 5.0);
      expect(badgeWidget.badgeStyle.badgeGradient?.focalRadius, 1.0);
    });

    testWidgets('Badge Sweep Gradient should match', (tester) async {
      BadgeGradient gradient = const BadgeGradient.sweep(
        colors: [Colors.purple, Colors.blue],
        center: Alignment.center,
        startAngle: 0.0,
        endAngle: 6.28,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(getBadgeGradient(gradient)));
      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.badgeGradient?.gradientType,
          BadgeGradientType.sweep);
      expect(badgeWidget.badgeStyle.badgeGradient?.colors.first, Colors.purple);
      expect(badgeWidget.badgeStyle.badgeGradient?.colors.last, Colors.blue);
      expect(badgeWidget.badgeStyle.badgeGradient?.center, Alignment.center);
      expect(badgeWidget.badgeStyle.badgeGradient?.startAngle, 0.0);
      expect(badgeWidget.badgeStyle.badgeGradient?.endAngle, 6.28);
      expect(badgeWidget.badgeStyle.badgeGradient?.stops, null);
      expect(badgeWidget.badgeStyle.badgeGradient?.transform, null);
      expect(badgeWidget.badgeStyle.badgeGradient?.tileMode, TileMode.clamp);
    });
  });

  group('Badge Border Gradient', () {
    Widget getBadge(BadgeShape shape) {
      return Badge(
        badgeContent: const Icon(Icons.add),
        badgeStyle: BadgeStyle(
          shape: shape,
          badgeColor: Colors.green,
          borderGradient: const BadgeGradient.linear(
            colors: [
              Colors.orange,
              Colors.blue,
            ],
          ),
        ),
      );
    }

    testWidgets('Badge Circle border gradient should match', (tester) async {
      await tester
          .pumpWidget(_wrapWithMaterialApp(getBadge(BadgeShape.circle)));
      final animatedController =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final boxDecoration = animatedController.decoration as BoxDecoration;
      final border = boxDecoration.border as BadgeBorderGradient;
      expect(boxDecoration.border.runtimeType, BadgeBorderGradient);
      expect(border.gradient.runtimeType, LinearGradient);
      expect(border.top, BorderSide.none);
      expect(border.isUniform, true);
      expect(border.bottom, BorderSide.none);
      expect(border.scale(2).runtimeType, BadgeBorderGradient);
    });

    testWidgets('Badge Circle border gradient should match', (tester) async {
      await tester
          .pumpWidget(_wrapWithMaterialApp(getBadge(BadgeShape.square)));
      final animatedController =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      final boxDecoration = animatedController.decoration as BoxDecoration;
      final border = boxDecoration.border as BadgeBorderGradient;
      expect(boxDecoration.border.runtimeType, BadgeBorderGradient);
      expect(border.gradient.runtimeType, LinearGradient);
      expect(border.top, BorderSide.none);
      expect(border.isUniform, true);
      expect(border.bottom, BorderSide.none);
    });
  });

  group('Custom Painters', () {
    group('Instagram shape', () {
      const instagramBadge = Badge(
        badgeStyle: BadgeStyle(
          shape: BadgeShape.instagram,
          badgeColor: Colors.green,
          badgeGradient:
              BadgeGradient.radial(colors: [Colors.black, Colors.green]),
          borderGradient:
              BadgeGradient.linear(colors: [Colors.red, Colors.yellow]),
          borderSide: BorderSide(width: 2),
        ),
      );

      testWidgets('Instagram badge should render correctly', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
        expect(find.byType(Badge), findsOneWidget);
        expect(find.byType(CustomPaint), findsWidgets);
      });

      testWidgets('Instagram badge color should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));

        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as InstagramBadgeShapePainter;
        expect(painter.color, Colors.green);
      });

      testWidgets('Instagram badge gradient should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as InstagramBadgeShapePainter;
        expect(painter.badgeGradient?.gradientType, BadgeGradientType.radial);
        expect(painter.badgeGradient?.colors.first, Colors.black);
        expect(painter.badgeGradient?.colors.last, Colors.green);
        expect(painter.badgeGradient?.colors.length, 2);
      });

      testWidgets('Instagram badge border gradient should match',
          (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as InstagramBadgeShapePainter;
        expect(painter.borderGradient?.gradientType, BadgeGradientType.linear);
        expect(painter.borderGradient?.colors.first, Colors.red);
        expect(painter.borderGradient?.colors.last, Colors.yellow);
        expect(painter.borderGradient?.colors.length, 2);
      });

      testWidgets('Instagram badge border should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as InstagramBadgeShapePainter;
        expect(painter.borderSide?.width, 2);
        expect(painter.borderSide?.style, BorderStyle.solid);
        expect(painter.borderSide?.strokeAlign, StrokeAlign.inside);
      });

      testWidgets('Instagram badge repaint should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as InstagramBadgeShapePainter;
        expect(painter.shouldRepaint(painter), true);
      });
    });

    group('Twitter shape', () {
      const twitterBadge = Badge(
        badgeStyle: BadgeStyle(
          shape: BadgeShape.twitter,
          badgeColor: Colors.red,
          badgeGradient:
              BadgeGradient.sweep(colors: [Colors.yellow, Colors.pink]),
          borderGradient:
              BadgeGradient.linear(colors: [Colors.red, Colors.blue]),
          borderSide: BorderSide(width: 5),
        ),
      );

      testWidgets('Twitter badge should render correctly', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
        expect(find.byType(CustomPaint), findsWidgets);
      });

      testWidgets('Twitter badge color should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as TwitterBadgeShapePainter;
        expect(painter.color, Colors.red);
      });

      testWidgets('Twitter badge gradient should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as TwitterBadgeShapePainter;
        expect(painter.badgeGradient?.gradientType, BadgeGradientType.sweep);
        expect(painter.badgeGradient?.colors.first, Colors.yellow);
        expect(painter.badgeGradient?.colors.last, Colors.pink);
        expect(painter.badgeGradient?.colors.length, 2);
      });

      testWidgets('Twitter badge border gradient should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as TwitterBadgeShapePainter;
        expect(painter.borderGradient?.gradientType, BadgeGradientType.linear);
        expect(painter.borderGradient?.colors.first, Colors.red);
        expect(painter.borderGradient?.colors.last, Colors.blue);
        expect(painter.borderGradient?.colors.length, 2);
      });

      testWidgets('Twitter badge border should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as TwitterBadgeShapePainter;
        expect(painter.borderSide?.width, 5);
        expect(painter.borderSide?.style, BorderStyle.solid);
        expect(painter.borderSide?.strokeAlign, StrokeAlign.inside);
      });

      testWidgets('Twitter badge repaint should match', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
        final customPaint =
            tester.widgetList<CustomPaint>(find.byType(CustomPaint)).last;
        final painter = customPaint.painter as TwitterBadgeShapePainter;
        expect(painter.shouldRepaint(painter), true);
      });
    });
  });

  group('Badge tests', () {
    bool isPressed = false;
    final badge = Badge(
      badgeStyle: BadgeStyle(
        shape: BadgeShape.square,
        borderRadius: BorderRadius.circular(5),
        padding: const EdgeInsets.all(2),
        badgeGradient: const BadgeGradient.linear(
          colors: [
            Colors.blue,
            Colors.yellow,
          ],
        ),
      ),
      position: BadgePosition.topEnd(top: -12, end: -20),
      badgeAnimation: const BadgeAnimation.scale(
        disappearanceFadeAnimationDuration: Duration(milliseconds: 300),
        animationDuration: Duration(milliseconds: 600),
      ),
      onTap: () {
        isPressed = true;
      },
      badgeContent: const Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: const Text(
        'MUSIC',
        style: TextStyle(),
      ),
    );

    testWidgets('Widget should render correctly', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.byType(Badge), findsOneWidget);
      // Finds text in badge content and text in child
      expect(find.byType(Text), findsAtLeastNWidgets(2));
    });

    testWidgets('Badge content should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.text('NEW'), findsOneWidget);
    });

    testWidgets('Child should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.text('MUSIC'), findsOneWidget);
    });

    testWidgets('Badge gradient colors should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(
        badgeWidget.badgeStyle.badgeGradient?.gradient().colors.first,
        Colors.blue,
      );
      expect(
        badgeWidget.badgeStyle.badgeGradient?.gradient().colors.last,
        Colors.yellow,
      );
    });

    testWidgets('Badge with child onTap is called', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));
      Finder badgeContentFinder = find.text('NEW');
      await tester.ensureVisible(badgeContentFinder);
      await tester.pumpAndSettle();
      await tester.tap(badgeContentFinder);

      expect(isPressed, true);
    });

    testWidgets('DisappearanceFadeAnimationDuration should match',
        (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeAnimation.disappearanceFadeAnimationDuration,
          const Duration(milliseconds: 300));
    });

    testWidgets('Default values should match', (tester) async {
      const Badge badge = Badge();
      await tester.pumpWidget(_wrapWithMaterialApp(badge));
      expect(find.byType(Badge), findsOneWidget);

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      // Badge values itself
      expect(badgeWidget.badgeContent, null);
      expect(badgeWidget.child, null);
      expect(badgeWidget.badgeStyle, const BadgeStyle());
      expect(badgeWidget.badgeAnimation, const BadgeAnimation.slide());
      expect(badgeWidget.position, null);
      expect(badgeWidget.showBadge, true);
      expect(badgeWidget.ignorePointer, false);
      expect(badgeWidget.stackFit, StackFit.loose);
      expect(badgeWidget.onTap, null);

      // Style
      expect(badgeWidget.badgeStyle.shape, BadgeShape.circle);
      expect(badgeWidget.badgeStyle.borderRadius, BorderRadius.zero);
      expect(badgeWidget.badgeStyle.badgeColor, Colors.red);
      expect(badgeWidget.badgeStyle.borderSide, BorderSide.none);
      expect(badgeWidget.badgeStyle.elevation, 2);
      expect(badgeWidget.badgeStyle.badgeGradient, null);
      expect(badgeWidget.badgeStyle.borderGradient, null);
      expect(badgeWidget.badgeStyle.padding, const EdgeInsets.all(5.0));

      // Animation
      expect(badgeWidget.badgeAnimation.toAnimate, true);
      expect(badgeWidget.badgeAnimation.animationDuration,
          const Duration(milliseconds: 500));
      expect(badgeWidget.badgeAnimation.loopAnimation, false);
      expect(badgeWidget.badgeAnimation.disappearanceFadeAnimationDuration,
          const Duration(milliseconds: 200));
      expect(badgeWidget.badgeAnimation.curve, Curves.elasticOut);
      expect(
          badgeWidget.badgeAnimation.slideTransitionPositionTween,
          const SlideTween(
            begin: Offset(-0.5, 0.9),
            end: Offset(0.0, 0.0),
          ));
      expect(
          badgeWidget.badgeAnimation.colorChangeAnimationCurve, Curves.linear);
      expect(badgeWidget.badgeAnimation.colorChangeAnimationDuration,
          Duration.zero);
      expect(
          badgeWidget.badgeAnimation.animationType, BadgeAnimationType.slide);
      expect(badgeWidget.badgeAnimation.sizeTransitionAxis, null);
      expect(
          badgeWidget
              .badgeAnimation.appearanceDisappearanceFadeAnimationEnabled,
          true);
      expect(badgeWidget.badgeAnimation.sizeTransitionAxisAlignment, null);
    });

    testWidgets('Animation duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeAnimation.animationDuration,
          const Duration(milliseconds: 600));
    });

    testWidgets('Shape should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.shape, BadgeShape.square);
    });

    testWidgets('Badge without child onTap is called', (tester) async {
      bool isPressed = false;
      final badgeWidget = Badge(
        onTap: () => isPressed = true,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(badgeWidget));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Badge));
      expect(isPressed, true);
    });
  });

  group('Badge animation tests', () {
    Widget getAnimationBadge(BadgeAnimation animation) {
      return Badge(
        badgeAnimation: animation,
        badgeContent: const Icon(Icons.check),
        child: const SizedBox(
          width: 30,
          height: 30,
        ),
      );
    }

    testWidgets('Badge animation should match', (tester) async {
      // Just checking that assiging the specitic animation in constructor will be actually assigned

      // Fade
      await tester.pumpWidget(
          _wrapWithMaterialApp(getAnimationBadge(const BadgeAnimation.fade())));
      Badge animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(
          animationBadge.badgeAnimation.animationType, BadgeAnimationType.fade);

      // Size
      await tester.pumpWidget(
          _wrapWithMaterialApp(getAnimationBadge(const BadgeAnimation.size())));
      animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(
          animationBadge.badgeAnimation.animationType, BadgeAnimationType.size);

      // Rotation
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const BadgeAnimation.rotation())));
      animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(animationBadge.badgeAnimation.animationType,
          BadgeAnimationType.rotation);

      // Slide
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const BadgeAnimation.slide())));
      animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(animationBadge.badgeAnimation.animationType,
          BadgeAnimationType.slide);

      // Scale
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const BadgeAnimation.scale())));
      animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(animationBadge.badgeAnimation.animationType,
          BadgeAnimationType.scale);
    });
  });

  group('Change Content Badge Animation Tests', () {
    contentChangeBadgeAnimationTests(BadgeAnimationType.rotation);

    contentChangeBadgeAnimationTests(BadgeAnimationType.size);

    contentChangeBadgeAnimationTests(BadgeAnimationType.slide);

    contentChangeBadgeAnimationTests(BadgeAnimationType.scale);

    contentChangeBadgeAnimationTests(BadgeAnimationType.fade);
  });
  group('First Appearance Badge Animation Tests', () {
    firstAppearanceBadgeAnimationTests(BadgeAnimationType.rotation);

    firstAppearanceBadgeAnimationTests(BadgeAnimationType.fade);

    firstAppearanceBadgeAnimationTests(BadgeAnimationType.scale);

    firstAppearanceBadgeAnimationTests(BadgeAnimationType.size);

    firstAppearanceBadgeAnimationTests(BadgeAnimationType.slide);
  });

  group('Color Change Animation Tests', () {
    colorChangeBadgeAnimationTests(BadgeAnimationType.fade);

    colorChangeBadgeAnimationTests(BadgeAnimationType.slide);

    colorChangeBadgeAnimationTests(BadgeAnimationType.size);

    colorChangeBadgeAnimationTests(BadgeAnimationType.scale);

    colorChangeBadgeAnimationTests(BadgeAnimationType.fade);

    colorChangeBadgeAnimationTests(BadgeAnimationType.rotation);
  });

  group('To Animate Badge Animation Tests', () {
    toAnimateBadgeAnimationTest(BadgeAnimationType.fade);

    toAnimateBadgeAnimationTest(BadgeAnimationType.slide);

    toAnimateBadgeAnimationTest(BadgeAnimationType.size);

    toAnimateBadgeAnimationTest(BadgeAnimationType.scale);

    toAnimateBadgeAnimationTest(BadgeAnimationType.rotation);
  });

  group('Loop Badge Animation Tests', () {
    loopBadgeAnimationTests(BadgeAnimationType.fade);

    loopBadgeAnimationTests(BadgeAnimationType.rotation);

    loopBadgeAnimationTests(BadgeAnimationType.scale);

    loopBadgeAnimationTests(BadgeAnimationType.size);

    loopBadgeAnimationTests(BadgeAnimationType.slide);
  });

  group('Show Hide Badge Animation Tests', () {
    showHideBadgeAnimationTests(BadgeAnimationType.rotation);

    showHideBadgeAnimationTests(BadgeAnimationType.fade);

    showHideBadgeAnimationTests(BadgeAnimationType.scale);

    showHideBadgeAnimationTests(BadgeAnimationType.size);

    showHideBadgeAnimationTests(BadgeAnimationType.slide);
  });

  group('Opacity Badge Animation Tests', () {
    opacityBadgeAnimationTests(BadgeAnimationType.rotation);

    opacityBadgeAnimationTests(BadgeAnimationType.scale);

    opacityBadgeAnimationTests(BadgeAnimationType.size);

    opacityBadgeAnimationTests(BadgeAnimationType.fade);

    opacityBadgeAnimationTests(BadgeAnimationType.slide);
  });

  group('Ignore Pointer Badge Tests', () {
    testWidgets('Ignore Pointer Badge Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const TestWidgetScreen(
          ignorePointer: true,
          toChangeContent: true,
          badgeAnimationType: BadgeAnimationType.scale,
          animationDuration: Duration(seconds: 1),
          appearanceDuration: Duration(seconds: 0),
        ),
      );

      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);

      await tester.tap(find.text('1'), warnIfMissed: false);

      await tester.pump();
      expect(tester.hasRunningAnimations, false);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);

      expect(find.text('2'), findsNothing);
    });
  });
}

Widget _wrapWithMaterialApp(Widget testWidget) {
  return MaterialApp(home: Scaffold(body: testWidget));
}
