import 'package:badges/badges.dart';
import 'package:example/alarm_app.dart';
import 'package:example/flag_app.dart';
import 'package:example/human_avatar.dart';
import 'package:example/instagram_message.dart';
import 'package:example/yako_app.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cartBadgeAmount = 3;
  late bool _showCartBadge;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: AppBar(
          leading: Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          title: Text('Badges Demo'),
          actions: <Widget>[
            _shoppingCartBadge(),
          ],
          bottom: _tabBar(),
        ),
        body: Column(
          children: <Widget>[
            _addRemoveCartButtons(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AlarmApp(),
                      YakoApp(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlagApp(),
                      HumanAvatar(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36, left: 24, right: 24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InstagramMessage(
                          text: 'Dude, that Chamber of Reflections\n'
                              'song is so sick!',
                          emojiReaction: '❤️',
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: InstagramMessage(
                              text: 'omg dude, I sent it to you 2 years ago',
                              emojiReaction: '😆')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: BadgeAnimation.scale(
        appearanceDuration: Duration(milliseconds: 200),
        curve: Curves.easeInCubic,
      ),
      showBadge: _showCartBadge,
      badgeStyle: BadgeStyle(
        badgeColor: color,
      ),
      badgeContent: Text(
        _cartBadgeAmount.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: Badge(
          badgeStyle: BadgeStyle(
            badgeColor: Colors.blue,
          ),
          position: BadgePosition.topEnd(top: -14),
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(
            Icons.account_balance_wallet,
            color: Colors.grey[800],
          ),
        ),
      ),
      Tab(
        child: Badge(
          badgeStyle: BadgeStyle(
            shape: BadgeShape.square,
            borderRadius: BorderRadius.circular(5),
            padding: EdgeInsets.all(2),
            gradient: LinearGradient(colors: [
              Colors.purple,
              Colors.blue,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          position: BadgePosition.topEnd(top: -12, end: -20),
          badgeContent: Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: Text(
            'music',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    ]);
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: 'Events',
          icon: Icon(Icons.dashboard),
        ),
        BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(Icons.notifications),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Badge(
            position: BadgePosition.topEnd(),
            badgeStyle: BadgeStyle(
              padding: EdgeInsets.all(6),
            ),
            badgeContent: Container(
              height: 3,
              width: 3,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
            child: Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () => setState(() {
                    _cartBadgeAmount++;
                    if (color == Colors.blue) {
                      color = Colors.red;
                    }
                  }),
              icon: Icon(Icons.add),
              label: Text('Add to cart')),
          ElevatedButton.icon(
              onPressed: _showCartBadge
                  ? () => setState(() {
                        _cartBadgeAmount--;
                        color = Colors.blue;
                      })
                  : null,
              icon: Icon(Icons.remove),
              label: Text('Remove from cart')),
        ],
      ),
    );
  }
}
