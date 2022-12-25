[![Pub Version](https://img.shields.io/pub/v/badges?color=blueviolet)](https://pub.dev/packages/badges)


<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/docs/readme/images/readme_header.png?raw=true">
</p>
<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/docs/readme/images/showcase.gif?raw=true" height="600px">
</p>


## Installing:
In your pubspec.yaml
```yaml
dependencies:
  badges: ^3.0.0
```
```dart
import 'package:badges/badges.dart';
```
<br>

## Basic Usage:
```dart
    Badge(
      badgeContent: Text('3'),
      child: Icon(Icons.settings),
    )
```
## Advanced usage
```dart
    Badge(
      position: BadgePosition.bottomEnd(bottom: -10, end: -12),
      showBadge: _showBadge,
      badgeContent:
        Icon(Icons.check, color: Colors.white, size: 10),
      badgeAnimation: BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
      badgeStyle: BadgeStyle(
        shape: BadgeShape.twitter, badgeColor: Colors.blue),
      child: Text(_badgeText),
```

<br>

## Animations:

<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/docs/readme/images/badge_animations_preview.gif?raw=true" height="200px">
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

## Shapes:

<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/docs/readme/images/badge_shapes_preview.png?raw=true" height="120px">
</p>
From left to right:<br>
1) BadgeShape.circle
2) BadgeShape.square
3) BadgeShape.twitter
4) BadgeShape.instagram
<br>
