import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Badge Widget', (tester) async {
    final blueColor = Colors.blue;
    final blackColor = Colors.black;
    final yellowColor = Colors.yellow;

    final badge = Badge(
      key: Key('badgeWidget'),
      showBadge: false,
      badgeContent: Text(
        '333',
        textDirection: TextDirection.ltr,
      ),
      badgeColor: blueColor,
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      onTap: () {},
      gradient: LinearGradient(
        colors: [
          blackColor,
          yellowColor,
        ],
      ),
    );
    await tester.pumpWidget(badge);

    final badgeFinder = find.byKey(ValueKey('badgeWidget'));

    final textFinder  = find.text('333');

    await tester.ensureVisible(textFinder);

    expect(badgeFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);

    expect(blueColor, badge.badgeColor);
    expect(blackColor, badge.gradient?.colors.first);
    expect(yellowColor, badge.gradient?.colors.last);
  });
}

