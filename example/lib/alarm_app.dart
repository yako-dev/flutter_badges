import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class AlarmApp extends StatelessWidget {
  const AlarmApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: Text('1', style: TextStyle(color: Colors.white)),
      padding: EdgeInsets.all(7),
      position: BadgePosition.topEnd(top: -12),
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
    );
  }
}
