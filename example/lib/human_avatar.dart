import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HumanAvatar extends StatefulWidget {
  const HumanAvatar({
    Key? key,
  }) : super(key: key);

  @override
  State<HumanAvatar> createState() => _HumanAvatarState();
}

class _HumanAvatarState extends State<HumanAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.2),
    end: const Offset(0, -0.1),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        elevation: 0,
        badgeColor: Colors.blue,
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      badgeContent: SlideTransition(
          position: _offsetAnimation,
          child: Icon(Icons.arrow_upward, color: Colors.white, size: 16)),
      position: badges.BadgePosition.bottomEnd(bottom: 0, end: -4),
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
