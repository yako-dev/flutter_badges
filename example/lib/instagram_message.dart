import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class InstagramMessage extends StatefulWidget {
  const InstagramMessage(
      {Key? key, required this.text, required this.emojiReaction})
      : super(key: key);

  final String text;
  final String emojiReaction;

  @override
  State<InstagramMessage> createState() => _InstagramMessageState();
}

class _InstagramMessageState extends State<InstagramMessage> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.bottomStart(bottom: -20, start: 5),
      badgeContent: Text(widget.emojiReaction, style: TextStyle(fontSize: 20)),
      showBadge: _isLiked,
      badgeAnimation: BadgeAnimation.scale(
        animationDuration: Duration(milliseconds: 600),
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        // disappearanceFadeAnimationDuration: Duration.zero,
        curve: Curves.easeInCubic,
      ),
      badgeStyle: BadgeStyle(
        shape: BadgeShape.square,
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white, width: 2),
        badgeColor: Colors.grey.shade300,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      ),
      child: GestureDetector(
        onDoubleTap: () {
          setState(() => _isLiked = !_isLiked);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Text(widget.text, style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
