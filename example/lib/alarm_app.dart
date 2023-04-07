import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class AlarmApp extends StatefulWidget {
  const AlarmApp({
    Key? key,
  }) : super(key: key);

  @override
  State<AlarmApp> createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  bool _isLooped = true;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        borderSide: BorderSide(color: Colors.white, width: 2),
        shape: badges.BadgeShape.triangle,
        badgeGradient: badges.BadgeGradient.linear(
          colors: [
            Colors.red,
            Colors.orange,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      badgeAnimation: badges.BadgeAnimation.fade(
        animationDuration: Duration(seconds: 1),
        loopAnimation: _isLooped,
      ),
      ignorePointer: false,
      badgeContent: Container(
          width: 20,
          height: 20,
          child: Center(
            child: Text(
              '!',
              style: TextStyle(color: Colors.white),
            ),
          )),
      position: badges.BadgePosition.topEnd(top: -12),
      child: GestureDetector(
        onTap: () {
          setState(() => counter += 10);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.access_alarm_outlined,
            size: 34,
          ),
        ),
      ),
    );
  }
}
