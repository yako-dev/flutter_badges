[![Pub Version](https://img.shields.io/pub/v/badges?color=blueviolet)](https://pub.dev/packages/badges)
[![popularity](https://img.shields.io/pub/popularity/badges?logo=dart)](https://pub.dev/packages/badges/score)
[![likes](https://img.shields.io/pub/likes/badges?logo=dart)](https://pub.dev/packages/badges/score)
![building](https://github.com/yako-dev/flutter_badges/actions/workflows/code-quality-tests.yml/badge.svg)
[![style: flutter lints](https://img.shields.io/badge/style-flutter__lints-blue)](https://pub.dev/packages/flutter_lints)
[![Package of the week](https://img.shields.io/badge/Package%20of-the%20week-orange)](https://youtu.be/_CIHLJHVoN8)




<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/readme_header.png?raw=true">
</p>
<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/showcase.gif?raw=true" height="600px">
</p>


## Installing:
In your pubspec.yaml
```yaml
dependencies:
  badges: ^3.0.2
```
Attention! In Flutter 3.7 the Badge widget was introduced in the Material library, so to escape the ambiguous imports you need to import the package like this:
```dart
import 'package:badges/badges.dart' as badges;
```
and then use the "badges.Badge" widget instead of the "Badge" widget. The same for all the classes from this package.
<br>
<br>

## Basic Usage:
```dart
    badges.Badge(
      badgeContent: Text('3'),
      child: Icon(Icons.settings),
    )
```
## Advanced usage
```dart
    badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      showBadge: true,
      ignorePointer: false,
      onTap: () {},
      badgeContent:
          Icon(Icons.check, color: Colors.white, size: 10),
      badgeAnimation: badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: Colors.blue,
        padding: EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderGradient: badges.BadgeGradient.linear(
            colors: [Colors.red, Colors.black]),
        badgeGradient: badges.BadgeGradient.linear(
            colors: [Colors.blue, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        ),
        elevation: 0,
      ),
      child: Text('Badge'),
    ),
```

<br>

---

## Animations:

<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/badge_animations_preview.gif?raw=true" height="200px">
</p>
From left to right:<br>
1) Color change animation
2) BadgeAnimation.slide
3) BadgeAnimation.fade
4) BadgeAnimation.scale
5) BadgeAnimation.size
6) BadgeAnimation.rotation
<br>
Also, loop animation is available, this will loop the animation until you stop it.
<br><br>

---

## Shapes:

<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/badge_shapes_preview.png?raw=true" height="120px">
</p>
From left to right:<br>
1) BadgeShape.circle
2) BadgeShape.square
3) BadgeShape.twitter
4) BadgeShape.instagram
<br><br>

---

## Migration from Badges 2:

<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/migration_guide.png?raw=true">
</p>

Check out other Yako packages:
[Settings UI](https://pub.dev/packages/settings_ui),
[Status Alert](https://pub.dev/packages/status_alert), 
[Full Screen Menu](https://pub.dev/packages/full_screen_menu) and more to come!