import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HumanAvatar extends StatelessWidget {
  const HumanAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      elevation: 0,
      badgeColor: Colors.blue,
      badgeContent: Icon(Icons.arrow_upward, color: Colors.white, size: 16),
      position: BadgePosition.bottomEnd(bottom: 0, end: -4),
      borderSide: BorderSide(color: Colors.white, width: 2),
      child: CircleAvatar(
        radius: 34,
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/getman.jpeg'),
          ),
        ),
      ),
    );
  }
}
