import 'package:badges/badges.dart' as badges;
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
import 'badge_animations_tests/to_animate_badge_animation_tests.dart';
import 'test_widget_screen.dart';
import 'utils_tests.dart';

void main() {
  group('Badge Position tests', () {
    Widget getBadge(badges.BadgePosition position) {
      return badges.Badge(
        badgeContent: const Text('test'),
        position: position,
      );
    }

    testWidgets('Badge Position topEnd should match', (tester) async {
      badges.BadgePosition position = badges.BadgePosition.topEnd();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position center should match', (tester) async {
      badges.BadgePosition position = badges.BadgePosition.center();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position bottomEnd should match', (tester) async {
      badges.BadgePosition position = badges.BadgePosition.bottomEnd();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position bottomStart should match', (tester) async {
      badges.BadgePosition position = badges.BadgePosition.bottomStart();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.position, position);
    });

    testWidgets('Badge Position topStart should match', (tester) async {
      badges.BadgePosition position = badges.BadgePosition.topStart();
      await tester.pumpWidget(_wrapWithMaterialApp(getBadge(position)));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.position, position);
    });
  });

  group('Badge Gradient tests', () {
    Widget getBadgeGradient(badges.BadgeGradient gradient) {
      return badges.Badge(
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.square,
            badgeGradient: gradient,
          ),
          position: badges.BadgePosition.topEnd(top: -12, end: -20),
          badgeContent: const Text('NEW'));
    }

    testWidgets('Badge Linear Gradient should match', (tester) async {
      badges.BadgeGradient gradient = const badges.BadgeGradient.linear(
        colors: [Colors.purple, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(getBadgeGradient(gradient)));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
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
      badges.BadgeGradient gradient = const badges.BadgeGradient.radial(
        colors: [Colors.purple, Colors.blue],
        center: Alignment.center,
        radius: 5,
        focal: Alignment.topRight,
        focalRadius: 1,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(getBadgeGradient(gradient)));
      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
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
      badges.BadgeGradient gradient = const badges.BadgeGradient.sweep(
        colors: [Colors.purple, Colors.blue],
        center: Alignment.center,
        startAngle: 0.0,
        endAngle: 6.28,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(getBadgeGradient(gradient)));
      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
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
    Widget getBadge(badges.BadgeShape shape) {
      return badges.Badge(
        badgeContent: const Icon(Icons.add),
        badgeStyle: badges.BadgeStyle(
          shape: shape,
          badgeColor: Colors.green,
          borderGradient: const badges.BadgeGradient.linear(
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
          .pumpWidget(_wrapWithMaterialApp(getBadge(badges.BadgeShape.circle)));
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
          .pumpWidget(_wrapWithMaterialApp(getBadge(badges.BadgeShape.square)));
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
      const instagramBadge = badges.Badge(
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.instagram,
          badgeColor: Colors.green,
          badgeGradient:
              badges.BadgeGradient.radial(colors: [Colors.black, Colors.green]),
          borderGradient:
              badges.BadgeGradient.linear(colors: [Colors.red, Colors.yellow]),
          borderSide: BorderSide(width: 2),
        ),
      );

      testWidgets('Instagram badge should render correctly', (tester) async {
        await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
        expect(find.byType(badges.Badge), findsOneWidget);
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
        // expect(painter.borderSide?.strokeAlign, StrokeAlign.inside);
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
      const twitterBadge = badges.Badge(
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.twitter,
          badgeColor: Colors.red,
          badgeGradient:
              badges.BadgeGradient.sweep(colors: [Colors.yellow, Colors.pink]),
          borderGradient:
              badges.BadgeGradient.linear(colors: [Colors.red, Colors.blue]),
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
        // expect(painter.borderSide?.strokeAlign, StrokeAlign.inside);
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
    final badge = badges.Badge(
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        borderRadius: BorderRadius.circular(5),
        padding: const EdgeInsets.all(2),
        badgeColor: Colors.transparent,
        badgeGradient: const badges.BadgeGradient.linear(
          colors: [
            Colors.blue,
            Colors.yellow,
          ],
        ),
      ),
      position: badges.BadgePosition.topEnd(top: -12, end: -20),
      badgeAnimation: const badges.BadgeAnimation.scale(
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

      expect(find.byType(badges.Badge), findsOneWidget);
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

    testWidgets('Badge background color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(
        badgeWidget.badgeStyle.badgeColor,
        Colors.transparent,
      );
    });

    testWidgets('Badge gradient colors should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
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

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.badgeAnimation.disappearanceFadeAnimationDuration,
          const Duration(milliseconds: 300));
    });

    testWidgets('Default values should match', (tester) async {
      const badges.Badge badge = badges.Badge();
      await tester.pumpWidget(_wrapWithMaterialApp(badge));
      expect(find.byType(badges.Badge), findsOneWidget);

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      // Badge values itself
      expect(badgeWidget.badgeContent, null);
      expect(badgeWidget.child, null);
      expect(badgeWidget.badgeStyle, const badges.BadgeStyle());
      expect(badgeWidget.badgeAnimation, const badges.BadgeAnimation.slide());
      expect(badgeWidget.position, null);
      expect(badgeWidget.showBadge, true);
      expect(badgeWidget.ignorePointer, false);
      expect(badgeWidget.stackFit, StackFit.loose);
      expect(badgeWidget.onTap, null);

      // Style
      expect(badgeWidget.badgeStyle.shape, badges.BadgeShape.circle);
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
          const badges.SlideTween(
            begin: Offset(-0.5, 0.9),
            end: Offset(0.0, 0.0),
          ));
      expect(
          badgeWidget.badgeAnimation.colorChangeAnimationCurve, Curves.linear);
      expect(badgeWidget.badgeAnimation.colorChangeAnimationDuration,
          Duration.zero);
      expect(badgeWidget.badgeAnimation.animationType,
          badges.BadgeAnimationType.slide);
      expect(badgeWidget.badgeAnimation.sizeTransitionAxis, null);
      expect(
          badgeWidget
              .badgeAnimation.appearanceDisappearanceFadeAnimationEnabled,
          true);
      expect(badgeWidget.badgeAnimation.sizeTransitionAxisAlignment, null);
    });

    testWidgets('Animation duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.badgeAnimation.animationDuration,
          const Duration(milliseconds: 600));
    });

    testWidgets('Shape should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(badgeWidget.badgeStyle.shape, badges.BadgeShape.square);
    });

    testWidgets('Badge without child onTap is called', (tester) async {
      bool isPressed = false;
      final badgeWidget = badges.Badge(
        onTap: () => isPressed = true,
      );
      await tester.pumpWidget(_wrapWithMaterialApp(badgeWidget));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(badges.Badge));
      expect(isPressed, true);
    });
  });

  group('Badge animation tests', () {
    Widget getAnimationBadge(badges.BadgeAnimation animation) {
      return badges.Badge(
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
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const badges.BadgeAnimation.fade())));
      badges.Badge animationBadge =
          tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(animationBadge.badgeAnimation.animationType,
          badges.BadgeAnimationType.fade);

      // Size
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const badges.BadgeAnimation.size())));
      animationBadge = tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(animationBadge.badgeAnimation.animationType,
          badges.BadgeAnimationType.size);

      // Rotation
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const badges.BadgeAnimation.rotation())));
      animationBadge = tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(animationBadge.badgeAnimation.animationType,
          badges.BadgeAnimationType.rotation);

      // Slide
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const badges.BadgeAnimation.slide())));
      animationBadge = tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(animationBadge.badgeAnimation.animationType,
          badges.BadgeAnimationType.slide);

      // Scale
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const badges.BadgeAnimation.scale())));
      animationBadge = tester.widget<badges.Badge>(find.byType(badges.Badge));
      expect(animationBadge.badgeAnimation.animationType,
          badges.BadgeAnimationType.scale);
    });
  });

  group('Change Content Badge Animation Tests', () {
    contentChangeBadgeAnimationTests(badges.BadgeAnimationType.rotation);

    contentChangeBadgeAnimationTests(badges.BadgeAnimationType.size);

    contentChangeBadgeAnimationTests(badges.BadgeAnimationType.slide);

    contentChangeBadgeAnimationTests(badges.BadgeAnimationType.scale);

    contentChangeBadgeAnimationTests(badges.BadgeAnimationType.fade);
  });

  group('First Appearance Badge Animation Tests', () {
    firstAppearanceBadgeAnimationTests(badges.BadgeAnimationType.rotation);

    firstAppearanceBadgeAnimationTests(badges.BadgeAnimationType.fade);

    firstAppearanceBadgeAnimationTests(badges.BadgeAnimationType.scale);

    firstAppearanceBadgeAnimationTests(badges.BadgeAnimationType.size);

    firstAppearanceBadgeAnimationTests(badges.BadgeAnimationType.slide);
  });

  group('Color Change Animation Tests', () {
    colorChangeBadgeAnimationTests(badges.BadgeAnimationType.fade);

    colorChangeBadgeAnimationTests(badges.BadgeAnimationType.slide);

    colorChangeBadgeAnimationTests(badges.BadgeAnimationType.size);

    colorChangeBadgeAnimationTests(badges.BadgeAnimationType.scale);

    colorChangeBadgeAnimationTests(badges.BadgeAnimationType.fade);

    colorChangeBadgeAnimationTests(badges.BadgeAnimationType.rotation);
  });

  group('To Animate Badge Animation Tests', () {
    toAnimateBadgeAnimationTest(badges.BadgeAnimationType.fade);

    toAnimateBadgeAnimationTest(badges.BadgeAnimationType.slide);

    toAnimateBadgeAnimationTest(badges.BadgeAnimationType.size);

    toAnimateBadgeAnimationTest(badges.BadgeAnimationType.scale);

    toAnimateBadgeAnimationTest(badges.BadgeAnimationType.rotation);
  });

  group('Loop Badge Animation Tests', () {
    loopBadgeAnimationTests(badges.BadgeAnimationType.fade);

    loopBadgeAnimationTests(badges.BadgeAnimationType.rotation);

    loopBadgeAnimationTests(badges.BadgeAnimationType.scale);

    loopBadgeAnimationTests(badges.BadgeAnimationType.size);

    loopBadgeAnimationTests(badges.BadgeAnimationType.slide);
  });

  group('Show Hide Badge Animation Tests', () {
    showHideBadgeAnimationTests(badges.BadgeAnimationType.rotation);

    showHideBadgeAnimationTests(badges.BadgeAnimationType.fade);

    showHideBadgeAnimationTests(badges.BadgeAnimationType.scale);

    showHideBadgeAnimationTests(badges.BadgeAnimationType.size);

    showHideBadgeAnimationTests(badges.BadgeAnimationType.slide);
  });

  group('Opacity Badge Animation Tests', () {
    opacityBadgeAnimationTests(badges.BadgeAnimationType.rotation);

    opacityBadgeAnimationTests(badges.BadgeAnimationType.scale);

    opacityBadgeAnimationTests(badges.BadgeAnimationType.size);

    opacityBadgeAnimationTests(badges.BadgeAnimationType.fade);

    opacityBadgeAnimationTests(badges.BadgeAnimationType.slide);
  });

  group('Ignore Pointer Badge Tests', () {
    testWidgets('Ignore Pointer Badge Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const TestWidgetScreen(
          ignorePointer: true,
          toChangeContent: true,
          badgeAnimationType: badges.BadgeAnimationType.scale,
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

  group('Utils Tests', () {
    testUtils();
  });

  // ---------------------------------------------------------------------------
  // Badge without child (standalone mode)
  // ---------------------------------------------------------------------------
  group('Badge without child', () {
    testWidgets('renders badge content', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(
        const badges.Badge(badgeContent: Text('3')),
      ));
      expect(find.byType(badges.Badge), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      // No Stack directly inside the Badge widget tree (child overlay is absent)
      expect(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Stack),
        ),
        findsNothing,
      );
    });

    testWidgets('onTap fires when tapping standalone badge', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(_wrapWithMaterialApp(
        badges.Badge(
          badgeContent: const Text('!'),
          onTap: () => tapped = true,
        ),
      ));
      // Wait for the slide animation to settle so the badge is at its final
      // hit-testable position (SlideTransition uses FractionalTranslation which
      // shifts the rendered AND hit-test area during animation).
      await tester.pumpAndSettle();
      await tester.tap(find.byType(badges.Badge));
      expect(tapped, true);
    });

    testWidgets('ignorePointer absorbs taps on standalone badge',
        (tester) async {
      bool tapped = false;
      await tester.pumpWidget(_wrapWithMaterialApp(
        badges.Badge(
          badgeContent: const Text('!'),
          ignorePointer: true,
          onTap: () => tapped = true,
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(badges.Badge), warnIfMissed: false);
      expect(tapped, false);
    });
  });

  // ---------------------------------------------------------------------------
  // showBadge false at initial render
  // ---------------------------------------------------------------------------
  group('showBadge false at initial render', () {
    testWidgets('no animation starts and opacity is zero', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(
        const badges.Badge(
          showBadge: false,
          badgeContent: Text('hidden'),
          child: Icon(Icons.star),
        ),
      ));

      expect(tester.hasRunningAnimations, false);

      final Opacity opacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(opacityWidget.opacity, 0.0);
    });

    testWidgets('opacity is zero when toAnimate is also false', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(
        const badges.Badge(
          showBadge: false,
          badgeAnimation: badges.BadgeAnimation.slide(toAnimate: false),
          badgeContent: Text('hidden'),
          child: Icon(Icons.star),
        ),
      ));

      expect(tester.hasRunningAnimations, false);

      final Opacity opacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(opacityWidget.opacity, 0.0);
    });

    testWidgets('badge becomes visible when showBadge flips to true',
        (tester) async {
      bool showBadge = false;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) => MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  badges.Badge(
                    showBadge: showBadge,
                    badgeAnimation: const badges.BadgeAnimation.slide(
                      animationDuration: Duration(milliseconds: 300),
                      disappearanceFadeAnimationDuration:
                          Duration(milliseconds: 200),
                    ),
                    badgeContent: const Text('1'),
                    child: const Icon(Icons.star),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => showBadge = true),
                    child: const Text('show'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(tester.hasRunningAnimations, false);

      await tester.tap(find.text('show'));
      await tester.pump();

      expect(tester.hasRunningAnimations, true);

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);

      final Opacity opacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(opacityWidget.opacity, 1.0);
    });
  });

  // ---------------------------------------------------------------------------
  // BadgePosition factory constructor defaults
  // ---------------------------------------------------------------------------
  group('BadgePosition factory defaults', () {
    test('topEnd defaults', () {
      final pos = badges.BadgePosition.topEnd();
      expect(pos.top, -8);
      expect(pos.end, -10);
      expect(pos.bottom, null);
      expect(pos.start, null);
      expect(pos.isCenter, false);
    });

    test('topStart defaults', () {
      final pos = badges.BadgePosition.topStart();
      expect(pos.top, -5);
      expect(pos.start, -10);
      expect(pos.bottom, null);
      expect(pos.end, null);
      expect(pos.isCenter, false);
    });

    test('bottomEnd defaults', () {
      final pos = badges.BadgePosition.bottomEnd();
      expect(pos.bottom, -8);
      expect(pos.end, -10);
      expect(pos.top, null);
      expect(pos.start, null);
      expect(pos.isCenter, false);
    });

    test('bottomStart defaults', () {
      final pos = badges.BadgePosition.bottomStart();
      expect(pos.bottom, -8);
      expect(pos.start, -10);
      expect(pos.top, null);
      expect(pos.end, null);
      expect(pos.isCenter, false);
    });

    test('center sets isCenter true and all offsets null', () {
      final pos = badges.BadgePosition.center();
      expect(pos.isCenter, true);
      expect(pos.top, null);
      expect(pos.end, null);
      expect(pos.bottom, null);
      expect(pos.start, null);
    });

    test('custom passes all values through', () {
      final pos = badges.BadgePosition.custom(
        top: 1,
        end: 2,
        bottom: 3,
        start: 4,
        isCenter: true,
      );
      expect(pos.top, 1);
      expect(pos.end, 2);
      expect(pos.bottom, 3);
      expect(pos.start, 4);
      expect(pos.isCenter, true);
    });
  });

  // ---------------------------------------------------------------------------
  // Icon content change triggers animation
  // ---------------------------------------------------------------------------
  group('Icon content change triggers animation', () {
    testWidgets('changing Icon data re-triggers animation', (tester) async {
      IconData currentIcon = Icons.star;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) => MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      animationDuration: Duration(seconds: 1),
                      disappearanceFadeAnimationDuration: Duration.zero,
                    ),
                    badgeContent: Icon(currentIcon),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => currentIcon = Icons.check),
                    child: const Text('change icon'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);

      await tester.tap(find.text('change icon'));
      await tester.pump();

      expect(tester.hasRunningAnimations, true);
      expect(find.byIcon(Icons.check), findsOneWidget);

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);
    });

    testWidgets('same Icon data does not re-trigger animation', (tester) async {
      IconData currentIcon = Icons.star;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) => MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      animationDuration: Duration(seconds: 1),
                      disappearanceFadeAnimationDuration: Duration.zero,
                    ),
                    badgeContent: Icon(currentIcon),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  GestureDetector(
                    // Reassign same icon — no real change.
                    // Using GestureDetector (not ElevatedButton) to avoid
                    // ink-ripple animations polluting hasRunningAnimations.
                    onTap: () => setState(() => currentIcon = Icons.star),
                    child: const Text('no-op'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);

      await tester.tap(find.text('no-op'));
      await tester.pump();

      expect(tester.hasRunningAnimations, false);
    });
  });

  // ---------------------------------------------------------------------------
  // Non-Text/non-Icon content does not re-trigger animation (current behavior)
  // ---------------------------------------------------------------------------
  group('Non-Text/non-Icon content change does not re-trigger animation', () {
    // The current implementation only tracks Text.data and Icon.icon changes.
    // Any other widget type as badgeContent will not restart the animation
    // when the content changes. This test documents that existing limitation.
    testWidgets('replacing a Container badge content does not animate',
        (tester) async {
      Color containerColor = Colors.blue;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) => MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  badges.Badge(
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      animationDuration: Duration(seconds: 1),
                      disappearanceFadeAnimationDuration: Duration.zero,
                    ),
                    badgeContent: Container(
                      width: 8,
                      height: 8,
                      color: containerColor,
                    ),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  GestureDetector(
                    // Using GestureDetector (not ElevatedButton) to avoid
                    // ink-ripple animations polluting hasRunningAnimations.
                    onTap: () => setState(() => containerColor = Colors.red),
                    child: const Text('change'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, false);

      await tester.tap(find.text('change'));
      await tester.pump();

      // No animation re-triggered because Container is not Text or Icon
      expect(tester.hasRunningAnimations, false);
    });
  });

  // ---------------------------------------------------------------------------
  // Issue #114 regression — showBadge false with loop animation
  // ---------------------------------------------------------------------------
  group('Issue #114 — showBadge false with loop animation', () {
    // Tests that setting showBadge: false correctly stops and hides a looping
    // badge. Uses scale animation where visibility is driven by
    // _appearanceController (separate from the loop animation controller).
    testWidgets('showBadge false stops loop and hides badge (scale animation)',
        // Bug fixed in Phase 2 (didUpdateWidget restructured so showBadge
        // changes are always handled before loop-animation guards).
        (tester) async {
      bool showBadge = true;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (context, setState) => MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  badges.Badge(
                    showBadge: showBadge,
                    badgeAnimation: const badges.BadgeAnimation.scale(
                      animationDuration: Duration(milliseconds: 500),
                      disappearanceFadeAnimationDuration:
                          Duration(milliseconds: 200),
                      loopAnimation: true,
                    ),
                    badgeContent: const Text('1'),
                    child: const Icon(Icons.star),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => showBadge = false),
                    child: const Text('hide'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Badge loop should be running
      await tester.pump(const Duration(milliseconds: 600));
      expect(tester.hasRunningAnimations, true);

      // Hide the badge
      await tester.tap(find.text('hide'));
      await tester.pump();

      // After the disappearance fade duration, opacity should reach 0
      await tester.pump(const Duration(milliseconds: 250));

      final Opacity opacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(badges.Badge),
          matching: find.byType(Opacity),
        ),
      );
      expect(opacityWidget.opacity, 0.0);

      // All animations should stop once hidden
      await tester.pump(const Duration(milliseconds: 600));
      expect(tester.hasRunningAnimations, false);
    });
  });
}

Widget _wrapWithMaterialApp(Widget testWidget) {
  return MaterialApp(home: Scaffold(body: testWidget));
}
