import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class TwitterVerifiedAccount extends StatelessWidget {
  const TwitterVerifiedAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Color.fromRGBO(29, 161, 242, 1),
          child: Image.asset(
            'assets/twitter.png',
            width: 30,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Twitter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.fade(toAnimate: false),
                  badgeContent: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10,
                  ),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.twitter,
                    badgeColor: Colors.blue,
                  ),
                ),
                SizedBox(width: 5),
                Text('@twitter', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                badges.Badge(
                  badgeContent: Icon(
                    Icons.check,
                    color: Colors.grey,
                    size: 10,
                  ),
                  badgeAnimation: badges.BadgeAnimation.fade(toAnimate: false),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.twitter,
                    badgeColor: Colors.transparent,
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text('Official', style: TextStyle(color: Colors.grey)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
