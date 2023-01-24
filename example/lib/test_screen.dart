import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      // home: HomeScreen(),
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool _showCircleBadge = false;
  bool _showSquareBadge = false;
  bool _showTwitterBadge = false;
  bool _showInstagramBadge = false;
  bool _showChangeIconBadge = true;
  bool _showAnimMoreAppear = false;
  bool _showAnimLessAppear = false;
  bool _showAnimZero = false;
  bool _showAppearZero = false;
  Color _changeBadgeColor = Colors.purple;
  IconData _badgeIcon = Icons.account_balance_rounded;
  int _badgeAmount = 0;
  late bool _showBadgeAmount;

  @override
  Widget build(BuildContext context) {
    _showBadgeAmount = _badgeAmount > 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Badge Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Circle Badge with button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showCircleBadge = !_showCircleBadge;
                    }),
                    child: Text('Circle size'),
                  ),
                ),
                badges.Badge(
                  key: const Key('CircleBadge'),
                  badgeAnimation: badges.BadgeAnimation.size(
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showCircleBadge,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.green,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'circle',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                /// Square Badge with button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showSquareBadge = !_showSquareBadge;
                    }),
                    child: Text('Square fade'),
                  ),
                ),
                badges.Badge(
                  key: const Key('SquareBadge'),
                  badgeAnimation: badges.BadgeAnimation.fade(
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showSquareBadge,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.square,
                    badgeColor: Colors.black,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '1111',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Twitter Badge with button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showTwitterBadge = !_showTwitterBadge;
                    }),
                    child: Text('Twitter rotation'),
                  ),
                ),
                badges.Badge(
                  key: const Key('TwitterBadge'),
                  badgeAnimation: badges.BadgeAnimation.rotation(
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showTwitterBadge,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.twitter,
                    badgeColor: Colors.blue,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),

                /// Instagram Badge with button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showInstagramBadge = !_showInstagramBadge;
                    }),
                    child: Text('Instagram scale'),
                  ),
                ),
                badges.Badge(
                  key: const Key('InstagramBadge'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showInstagramBadge,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.instagram,
                    badgeColor: Colors.red,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Change Color Badge with button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      if (_changeBadgeColor == Colors.purple) {
                        _changeBadgeColor = Colors.orange;
                      } else
                        _changeBadgeColor = Colors.purple;
                    }),
                    child: Text('Change color'),
                  ),
                ),
                badges.Badge(
                  key: const Key('ChangeColorBadge'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: _changeBadgeColor,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.ac_unit_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),

                /// Change Icon Badge with button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      if (_showChangeIconBadge) {
                        if (_badgeIcon == Icons.account_balance_rounded) {
                          _badgeIcon = Icons.add;
                          _showChangeIconBadge = !_showChangeIconBadge;
                        } else {
                          _badgeIcon = Icons.account_balance_rounded;
                          _showChangeIconBadge = !_showChangeIconBadge;
                        }
                      } else {
                        _showChangeIconBadge = !_showChangeIconBadge;
                      }
                    }),
                    child: Text('Change icon'),
                  ),
                ),
                badges.Badge(
                  key: const Key('ChangeIconBadge'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    appearanceDisappearanceFadeAnimationEnabled: false,
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showChangeIconBadge,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.yellow,
                  ),
                  badgeContent: Icon(
                    _badgeIcon,
                    color: Colors.white,
                  ),
                )
              ],
            ),

            /// Change Amount Badge with button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () => setState(() {
                          _badgeAmount++;
                        }),
                    icon: Icon(Icons.add),
                    label: Text('Add')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton.icon(
                      onPressed: _badgeAmount != 0
                          ? () => setState(() {
                                _badgeAmount--;
                              })
                          : null,
                      icon: Icon(Icons.remove),
                      label: Text('Remove')),
                ),
                badges.Badge(
                  key: const Key('ChangeAmountBadge'),
                  badgeAnimation: badges.BadgeAnimation.slide(
                    toAnimate: false,
                    colorChangeAnimationDuration: Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showBadgeAmount,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.pink,
                  ),
                  badgeContent: Text(_badgeAmount.toString()),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Animation Duration More Appearance Duration
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showAnimMoreAppear = !_showAnimMoreAppear;
                    }),
                    child: Text('anim>appear'),
                  ),
                ),
                badges.Badge(
                  showBadge: _showAnimMoreAppear,
                  key: const Key('AnimationMoreAppearance'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration(milliseconds: 500),
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.green,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cloud,
                      color: Colors.white,
                    ),
                  ),
                ),

                /// Animation Duration Less Appearance Duration
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showAnimLessAppear = !_showAnimLessAppear;
                    }),
                    child: Text('anim<appear'),
                  ),
                ),
                badges.Badge(
                  key: const Key('AnimationLessAppearance'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration(milliseconds: 200),
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showAnimLessAppear,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.purple,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.sunny,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Animation Duration Zero
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showAnimZero = !_showAnimZero;
                    }),
                    child: Text('anim=zero'),
                  ),
                ),
                badges.Badge(
                  showBadge: _showAnimZero,
                  key: const Key('AnimationZero'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration.zero,
                    disappearanceFadeAnimationDuration:
                        Duration(milliseconds: 200),
                    curve: Curves.easeInCubic,
                  ),
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.black38,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.adb,
                      color: Colors.white,
                    ),
                  ),
                ),

                /// Appearance Duration Zero
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      _showAppearZero = !_showAppearZero;
                    }),
                    child: Text('appear=zero'),
                  ),
                ),
                badges.Badge(
                  key: const Key('AppearanceZero'),
                  badgeAnimation: badges.BadgeAnimation.scale(
                    animationDuration: Duration(milliseconds: 200),
                    disappearanceFadeAnimationDuration: Duration.zero,
                    curve: Curves.easeInCubic,
                  ),
                  showBadge: _showAppearZero,
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: Colors.brown,
                  ),
                  badgeContent: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.access_time,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
