# Badges for Flutter

[![Pub Version](https://img.shields.io/pub/v/badges?color=blueviolet)](https://pub.dev/packages/badges)

<p align="center">
  <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/logo.png" height="400px">
</p>


## Installing:
In your pubspec.yaml
```yaml
dependencies:
  badges: ^2.0.4
```
```dart
import 'package:badges/badges.dart';
```

<br>
<br>

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
| <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/first_badge_example.gif" height="200px"> | <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/second_badge_example.gif" height="200px"> | <img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/third_badge_example.gif" height="200px"> |
| -------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `BadgeAnimationType.slide`                                                                                                 | `BadgeAnimationType.scale`                                                                                                  | `BadgeAnimationType.fade`                                                                                                  |
<br>

# Chips:
Sometimes you may want to use chip but it's too big, even if set padding to zero. This is where Badge comes handy.
<img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/images/chip_badge_example.png" height="200px">
```dart
    Chip(
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.deepPurple,
      label: Text('BADGE', style: TextStyle(color: Colors.white)),
    ),
    Badge(
      toAnimate: false,
      shape: BadgeShape.square,
      badgeColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(8),
      badgeContent: Text('BADGE', style: TextStyle(color: Colors.white)),
    ),
```


## Custom Usage
There are several options that allow for more control:

| Properties                          | Description                                                                                                                                                                                                                                                                                                         |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Widget badgeContent`               | The content of badge. Usually `Text` or `Icon`.                                                                                                                                                                                                                                                                     |
| `Color badgeColor`                  | Background color of the badge.                                                                                                                                                                                                                                                                                      |
| `Widget child`                      | The main widget. By default it's below the red badge. Usually `Icon`, `IconButton`, `Text` or button.                                                                                                                                                                                                               |
| `double elevation`                  | Shadow of the badge.                                                                                                                                                                                                                                                                                                |
| `Gradient gradient`                 | Gradient color for the badge content.                                                                                                                                                                                                                                                                               |
| `bool toAnimate`                    | Whether animate badge when badge content changed or not.                                                                                                                                                                                                                                                            |
| `BadgePosition position`            | Can be one of `BadgePosition.topStart()`, `BadgePosition.topEnd()`, `BadgePosition.bottomStart()`, `BadgePosition.bottomEnd()`. Sometimes you want to create unique badge position or create new one manually. For this use `BadgePosition.topEnd(top: -12, end: -20)` or `BadgePosition(start, top, end, bottom)`. |
| `BadgeShape shape`                  | `BadgeShape.circle` or `BadgeShape.square`. You can use `borderRadius` to change border radius of badge of you use square `BadgeShape.square`.                                                                                                                                                                      |
| `BorderRadiusGeometry borderRadius` | Border radius of badge. Applies only if `BadgeShape.square` is used.                                                                                                                                                                                                                                                |
| `EdgeInsetsGeometry padding`        | The padding of badge content.                                                                                                                                                                                                                                                                                       |
| `Duration animationDuration`        | The duration of badge animation when badge content is changed.                                                                                                                                                                                                                                                      |
| `BadgeAnimationType animationType`  | Can be one of `BadgeAnimationType.slide`, `BadgeAnimationType.scale` or `BadgeAnimationType.fade`.                                                                                                                                                                                                                  |
| `bool showBadge`                    | Hide or show badge with animation using bool flag.                                                                                                                                                                                                                                                                  |
| `AlignmentGeometry alignment`       | Alignment of the whole widget                                                                                                                                                                                                                                                                                       |
| `bool ignorePointer`                | Enable or disable (default) ignore pointer option                                                                                                                                                                                                                                                                   |
| `BorderSide borderSide`             | Adds a border to the badge                                                                                                                                                                                                                                                                                          |

<br>
<br>

## License
This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details
