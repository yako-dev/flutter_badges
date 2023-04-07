import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class InstagramVerifiedAccount extends StatelessWidget {
  const InstagramVerifiedAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.2),
          radius: 24,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple,
                      Colors.pink,
                      Colors.orange,
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/instagram.png',
                    width: 30,
                    //color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'instagram',
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
                    shape: badges.BadgeShape.instagram,
                    badgeColor: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text('Instagram', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
