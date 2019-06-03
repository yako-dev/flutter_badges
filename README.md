# Badges for Flutter

A flutter package for creating badges.

[Package on Pub](https://pub.dartlang.org/packages/badges)

<img src="https://raw.githubusercontent.com/yadaniil/flutter_badges/master/logo.png" height="460px">


## Installing:
In your pubspec.yaml
```yaml
dependencies:
  badges: ^1.0.0
```
```dart
import 'package:badges/badges.dart';
```

## Example Usage:
```dart
    Badge(
      badgeContent: Text('3'),
      child: Icon(Icons.settings),
    )
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
| `BadgeAnimationType animationType` | Can be one of `BadgeAnimationType.slide`, `BadgeAnimationType.scale` or `BadgeAnimationType.fade`. Examples of animations will be displayed below. |


<br>
<br>

## License
This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details
