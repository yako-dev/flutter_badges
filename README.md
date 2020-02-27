# Badges for Flutter

[![pub package](https://img.shields.io/badge/pub-1.1.1-blueviolet.svg)](https://pub.dev/packages/badges)

<p align="center">
  <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/logo.png" height="400px">
</p>


## Installing:
In your pubspec.yaml
```yaml
dependencies:
  badges: ^1.1.1
```
```dart
import 'package:badges/badges.dart';
```


## Basic Usage:
```dart
    Badge(
      badgeContent: Text('3'),
      child: Icon(Icons.settings),
    )
```
<br>
<br>


## Animations:
| <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/first_badge_example.gif" height="200px">  | <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/second_badge_example.gif" height="200px"> | <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/third_badge_example.gif" height="200px"> |
| ------------- | ------------- | ------------ |
| `BadgeAnimationType.slide`  | `BadgeAnimationType.scale`  | `BadgeAnimationType.fade` |
<br>

# Chips:
Sometimes you may want to use chip but it's too big, even if set padding to zero. This is where Badge comes handy.
<img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/chip_badge_example.png" height="200px">
```dart
    Chip(
      backgroundColor: Colors.deepPurple,
      padding: EdgeInsets.all(0),
      label: Text('BADGE', style: TextStyle(color: Colors.white)),
    ),
    Badge(
      badgeColor: Colors.deepPurple,
      shape: BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text('BADGE', style: TextStyle(color: Colors.white)),
    ),
```


## Custom Usage
There are several options that allow for more control:

|  Properties  |   Description   |
|--------------|-----------------|
| `Widget badgeContent` | The content of badge. Usually `Text` or `Icon`. |
| `Color badgeColor` | Background color of the badge. |
| `Widget child` | The main widget. By default it's below the red badge. Usually `Icon`, `IconButton`, `Text` or button. |
| `double elevation` | Shadow of the badge. |
| `bool toAnimate` | Whether animate badge when badge content changed or not. |
| `BadgePosition position` | Can be one of `BadgePosition.topLeft()`, `BadgePosition.topRight()`, `BadgePosition.bottomLeft()`, `BadgePosition.bottomRight()`. Sometimes you want to create unique badge position or create new one manually. For this use `BadgePosition.topRight(top: -12, right: -20)` or `BadgePosition.(left, top, right, bottom)`. |
| `BadgeShape shape` | `BadgeShape.circle` or `BadgeShape.square`. You can use `borderRadius` to change border radius of badge of you use square `BadgeShape.square`. |
| `double borderRadius` | Border radius of badge. Applies only if `BadgeShape.square` is used. |
| `EdgeInsets padding` | The padding of badge content. |
| `Duration animationDuration` | The duration of badge animation when badge content is changed. |
| `BadgeAnimationType animationType` | Can be one of `BadgeAnimationType.slide`, `BadgeAnimationType.scale` or `BadgeAnimationType.fade`. |
| `bool showBadge` | Hide or show badge with animation using bool flag. |
| `Alignment alignment` | Alignment of the whole widget |

<br>
<br>

## License
This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details
