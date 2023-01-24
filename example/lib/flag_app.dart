import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class FlagApp extends StatelessWidget {
  const FlagApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.white,
      ),
      badgeContent: Text(
        '😃',
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      position: badges.BadgePosition.bottomEnd(bottom: -10),
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.flag, color: Colors.white, size: 40),
      ),
    );
  }
}
