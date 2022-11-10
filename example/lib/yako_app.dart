import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class YakoApp extends StatelessWidget {
  const YakoApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeStyle: BadgeStyle(
        shape: BadgeShape.square,
        borderRadius: BorderRadius.circular(10),
        badgeColor: Colors.black,
        borderSide: BorderSide(color: Colors.white, width: 2),
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      ),
      // elevation: 0,
      // shape: BadgeShape.square,
      // borderRadius: BorderRadius.circular(10),
      // badgeColor: Colors.black,
      // borderSide: BorderSide(color: Colors.white, width: 2),
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      badgeContent: Text('20', style: TextStyle(color: Colors.white)),
      position: BadgePosition.topEnd(top: -10),
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Yako',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
