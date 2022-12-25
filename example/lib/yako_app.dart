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
        borderSide: BorderSide(color: Colors.white, width: 2),
        badgeColor: Colors.black,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      ),
      badgeContent: Text('20', style: TextStyle(color: Colors.white)),
      position: BadgePosition.topEnd(top: -10),
      badgeAnimation: BadgeAnimation.size(toAnimate: true),
      onTap: () {
        print('asdfsadfs');
      },
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
