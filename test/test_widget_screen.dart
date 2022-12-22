import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'utils/animation_test_utils.dart';

class TestWidgetScreen extends StatefulWidget {
  final BadgeAnimationType badgeAnimationType;
  final Duration animationDuration;
  final Duration appearanceDuration;
  final Duration colorChangeDuration;
  final bool toAnimate;
  final bool loopAnimation;
  final bool toHideBadge;

  const TestWidgetScreen({
    Key? key,
    required this.badgeAnimationType,
    required this.animationDuration,
    required this.appearanceDuration,
    this.colorChangeDuration = Duration.zero,
    this.toHideBadge = false,
    this.toAnimate = true,
    this.loopAnimation = false,
  }) : super(key: key);

  @override
  State<TestWidgetScreen> createState() => _TestWidgetScreenState();
}

class _TestWidgetScreenState extends State<TestWidgetScreen> {
  Color color = Colors.blue;
  int content = 1;
  bool showBadge = true;
  bool loopAnimation = false;

  @override
  void initState() {
    super.initState();
    loopAnimation = widget.loopAnimation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Badge(
            showBadge: showBadge,
            badgeStyle: BadgeStyle(badgeColor: color),
            badgeAnimation: AnimationTestUtils.getAnimationByType(
              badgeAnimationType: widget.badgeAnimationType,
              animationDuration: widget.animationDuration,
              appearanceDuration: widget.appearanceDuration,
              toAnimate: widget.toAnimate,
              loopAnimation: loopAnimation,
              colorChangeDuration: widget.colorChangeDuration,
            ),
            badgeContent: Text(content.toString()),
            child: const Text('child'),
            onTap: () {
              setState(() {
                color = Colors.red;
                content++;
                if (widget.toHideBadge) {
                  showBadge = false;
                }
                if (widget.loopAnimation) {
                  loopAnimation = !loopAnimation;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
