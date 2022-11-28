import 'package:badges/badges.dart';
import 'package:badges/src/badge_border_gradient.dart';
import 'package:badges/src/badge_gradient_type.dart';
import 'package:badges/src/painters/instagram_badge_shape_painter.dart';
import 'package:badges/src/painters/twitter_badge_shape_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

    testWidgets('Badge Radial Gradient should match', (tester) async {
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

  group('Custom Painters tests', () {
    final instagramBadge = CustomPaint(
      painter: InstagramBadgeShapePainter(
        color: Colors.blue,
        badgeGradient:
            const BadgeGradient.radial(colors: [Colors.black, Colors.green]),
        borderGradient:
            const BadgeGradient.linear(colors: [Colors.red, Colors.yellow]),
        borderSide: const BorderSide(width: 2),
      ),
    );

    final twitterBadge = CustomPaint(
      painter: TwitterBadgeShapePainter(
        color: Colors.red,
        badgeGradient:
            const BadgeGradient.sweep(colors: [Colors.yellow, Colors.pink]),
        borderGradient:
            const BadgeGradient.linear(colors: [Colors.red, Colors.blue]),
        borderSide: const BorderSide(width: 5),
      ),
    );

    testWidgets('Instagram badge should render correctly', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('Instagram badge color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = instagramBadge.painter as InstagramBadgeShapePainter;
      expect(painter.color, Colors.blue);
    });

    testWidgets('Instagram badge gradient should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = instagramBadge.painter as InstagramBadgeShapePainter;
      expect(painter.badgeGradient?.gradientType, BadgeGradientType.radial);
      expect(painter.badgeGradient?.colors.first, Colors.black);
      expect(painter.badgeGradient?.colors.last, Colors.green);
      expect(painter.badgeGradient?.colors.length, 2);
    });

    testWidgets('Instagram badge border gradient should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = instagramBadge.painter as InstagramBadgeShapePainter;
      expect(painter.borderGradient?.gradientType, BadgeGradientType.linear);
      expect(painter.borderGradient?.colors.first, Colors.red);
      expect(painter.borderGradient?.colors.last, Colors.yellow);
      expect(painter.borderGradient?.colors.length, 2);
    });

    testWidgets('Instagram badge border should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = instagramBadge.painter as InstagramBadgeShapePainter;
      expect(painter.borderSide?.width, 2);
      expect(painter.borderSide?.style, BorderStyle.solid);
      expect(painter.borderSide?.strokeAlign, StrokeAlign.inside);
    });

    testWidgets('Instagram badge repaint should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(instagramBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = instagramBadge.painter as InstagramBadgeShapePainter;
      expect(painter.shouldRepaint(painter), true);
    });

    testWidgets('Twitter badge should render correctly', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('Twitter badge color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = twitterBadge.painter as TwitterBadgeShapePainter;
      expect(painter.color, Colors.red);
    });

    testWidgets('Twitter badge gradient should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = twitterBadge.painter as TwitterBadgeShapePainter;
      expect(painter.badgeGradient?.gradientType, BadgeGradientType.sweep);
      expect(painter.badgeGradient?.colors.first, Colors.yellow);
      expect(painter.badgeGradient?.colors.last, Colors.pink);
      expect(painter.badgeGradient?.colors.length, 2);
    });

    testWidgets('Twitter badge border gradient should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = twitterBadge.painter as TwitterBadgeShapePainter;
      expect(painter.borderGradient?.gradientType, BadgeGradientType.linear);
      expect(painter.borderGradient?.colors.first, Colors.red);
      expect(painter.borderGradient?.colors.last, Colors.blue);
      expect(painter.borderGradient?.colors.length, 2);
    });

    testWidgets('Twitter badge border should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = twitterBadge.painter as TwitterBadgeShapePainter;
      expect(painter.borderSide?.width, 5);
      expect(painter.borderSide?.style, BorderStyle.solid);
      expect(painter.borderSide?.strokeAlign, StrokeAlign.inside);
    });

    testWidgets('Twitter badge repaint should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(twitterBadge));
      expect(find.byType(CustomPaint), findsWidgets);
      final painter = twitterBadge.painter as TwitterBadgeShapePainter;
      expect(painter.shouldRepaint(painter), true);
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
        appearanceDuration: Duration(milliseconds: 300),
        animationDuration: Duration(milliseconds: 500),
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
    });

    testWidgets('Badge content should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.text('NEW'), findsOneWidget);
    });

    testWidgets('Child should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      expect(find.text('MUSIC'), findsOneWidget);
    });

    testWidgets('Badge default color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.badgeColor, Colors.red);
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

      final badgeFinder = find.descendant(
        of: find.byType(Badge),
        matching: find.byType(GestureDetector),
      );
      await tester.ensureVisible(badgeFinder);
      await tester.pumpAndSettle();
      await tester.tap(badgeFinder);

      expect(isPressed, true);
    });

    testWidgets('Badge animation type should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(
          badgeWidget.badgeAnimation.animationType, BadgeAnimationType.scale);
    });

    testWidgets('Badge appearance duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeAnimation.appearanceDuration,
          const Duration(milliseconds: 300));
    });

    testWidgets('Badge animation duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeAnimation.animationDuration,
          const Duration(milliseconds: 500));
    });

    testWidgets('Badge shape should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(badge));

      final badgeWidget = tester.widget<Badge>(find.byType(Badge));
      expect(badgeWidget.badgeStyle.shape, BadgeShape.square);
    });

    testWidgets('Badge without child onTap is called', (tester) async {
      bool isPressed = false;
      final badgeWidget = Badge(
        badgeAnimation: const BadgeAnimation.scale(toAnimate: false),
        badgeStyle: const BadgeStyle(
          elevation: 0,
          shape: BadgeShape.circle,
          padding: EdgeInsets.all(7),
        ),
        badgeContent: const Text('22'),
        onTap: () {
          isPressed = true;
        },
      );
      await tester.pumpWidget(_wrapWithMaterialApp(badgeWidget));

      await tester.ensureVisible(find.byType(Badge));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(Badge));

      expect(isPressed, true);
    });

    testWidgets('Badge without onTap', (tester) async {
      final badge = Badge(
        ignorePointer: true,
        badgeAnimation: const BadgeAnimation.scale(loopAnimation: true),
        badgeContent: const Icon(Icons.add),
        badgeStyle: const BadgeStyle(
          badgeColor: Colors.blue,
          borderSide: BorderSide(width: 3, color: Colors.yellow),
        ),
        child: Container(
          color: Colors.red,
          width: 40,
          height: 40,
        ),
      );

      await tester.pumpWidget(_wrapWithMaterialApp(badge));
      expect(find.byType(Badge), findsOneWidget);
    });
  });

  group('Badge animation tests', () {
    Widget getAnimationBadge(BadgeAnimation animation) {
      return Badge(
        position: BadgePosition.center(),
        badgeAnimation: animation,
        badgeContent: const Icon(Icons.check),
        badgeStyle: const BadgeStyle(
          badgeColor: Colors.red,
          shape: BadgeShape.instagram,
        ),
        child: Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
      );
    }

    testWidgets('Badge animation fade should match', (tester) async {
      await tester.pumpWidget(
          _wrapWithMaterialApp(getAnimationBadge(const BadgeAnimation.fade())));
      expect(find.byType(Badge), findsOneWidget);
      final animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(
          animationBadge.badgeAnimation.animationType, BadgeAnimationType.fade);
    });

    testWidgets('Badge animation scale should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const BadgeAnimation.scale())));
      expect(find.byType(Badge), findsOneWidget);
      final animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(animationBadge.badgeAnimation.animationType,
          BadgeAnimationType.scale);
    });

    testWidgets('Badge animation size should match', (tester) async {
      await tester.pumpWidget(
          _wrapWithMaterialApp(getAnimationBadge(const BadgeAnimation.size())));
      expect(find.byType(Badge), findsOneWidget);
      final animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(
          animationBadge.badgeAnimation.animationType, BadgeAnimationType.size);
    });

    testWidgets('Badge animation rotation should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const BadgeAnimation.rotation())));
      expect(find.byType(Badge), findsOneWidget);
      final animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(animationBadge.badgeAnimation.animationType,
          BadgeAnimationType.rotation);
    });

    testWidgets('Badge animation slide should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(
          getAnimationBadge(const BadgeAnimation.slide())));
      expect(find.byType(Badge), findsOneWidget);
      final animationBadge = tester.widget<Badge>(find.byType(Badge));
      expect(animationBadge.badgeAnimation.animationType,
          BadgeAnimationType.slide);
    });
  });
}

Widget _wrapWithMaterialApp(Widget testWidget) {
  return MaterialApp(home: Scaffold(body: testWidget));
}
