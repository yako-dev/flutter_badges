import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import 'utils/animation_test_utils.dart';

class TestWidgetScreen extends StatefulWidget {
  final badges.BadgeAnimationType badgeAnimationType;
  final Duration animationDuration;
  final Duration appearanceDuration;
  final Duration colorChangeDuration;
  final bool toAnimate;
  final bool loopAnimation;
  final bool toHideBadge;
  final bool toChangeContent;
  final bool appearanceDisappearanceFadeAnimationEnabled;
  final bool ignorePointer;

  const TestWidgetScreen({
    Key? key,
    required this.badgeAnimationType,
    required this.animationDuration,
    required this.appearanceDuration,
    this.colorChangeDuration = Duration.zero,
    this.toHideBadge = false,
    this.toAnimate = true,
    this.loopAnimation = false,
    this.toChangeContent = true,
    this.appearanceDisappearanceFadeAnimationEnabled = true,
    this.ignorePointer = false,
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
          child: badges.Badge(
            ignorePointer: widget.ignorePointer,
            showBadge: showBadge,
            badgeStyle: badges.BadgeStyle(badgeColor: color),
            badgeAnimation: AnimationTestUtils.getAnimationByType(
              badgeAnimationType: widget.badgeAnimationType,
              animationDuration: widget.animationDuration,
              appearanceDuration: widget.appearanceDuration,
              toAnimate: widget.toAnimate,
              loopAnimation: loopAnimation,
              colorChangeDuration: widget.colorChangeDuration,
              appearanceDisappearanceFadeAnimationEnabled:
                  widget.appearanceDisappearanceFadeAnimationEnabled,
            ),
            badgeContent: Text(content.toString()),
            child: const Text('child'),
            onTap: () {
              setState(() {
                color = Colors.red;
                if (widget.toChangeContent) {
                  content++;
                }
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
