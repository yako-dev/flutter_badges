import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class AlarmApp extends StatefulWidget {
  const AlarmApp({
    Key? key,
  }) : super(key: key);

  @override
  State<AlarmApp> createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  bool _isLooped = false;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeStyle: BadgeStyle(
        padding: EdgeInsets.all(7),
      ),
      onTap: () {
        setState(() => _isLooped = !_isLooped);
      },
      animationDuration: Duration(seconds: 1),
      loopAnimation: _isLooped,
      ignorePointer: false,
      // toAnimate: false,
      badgeContent:
          Text(counter.toString(), style: TextStyle(color: Colors.white)),
      position: BadgePosition.topEnd(top: -12),
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
