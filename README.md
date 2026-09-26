[![Pub Version](https://img.shields.io/pub/v/badges?color=blueviolet)](https://pub.dev/packages/badges)
[![downloads](https://img.shields.io/pub/dm/badges?logo=dart)](https://pub.dev/packages/badges/score)
[![likes](https://img.shields.io/pub/likes/badges?logo=dart)](https://pub.dev/packages/badges/score)
[![CI](https://github.com/yako-dev/flutter_badges/actions/workflows/ci.yml/badge.svg)](https://github.com/yako-dev/flutter_badges/actions/workflows/ci.yml)
[![style: flutter lints](https://img.shields.io/badge/style-flutter__lints-blue)](https://pub.dev/packages/flutter_lints)
[![Package of the week](https://img.shields.io/badge/Package%20of-the%20week-orange)](https://youtu.be/_CIHLJHVoN8)




<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/readme_header.png?raw=true">
</p>
<p align="center">
  <img src="https://github.com/yako-dev/flutter_badges/blob/master/images/showcase.gif?raw=true" height="400px">
</p>


## Installing:
In your pubspec.yaml
```yaml
dependencies:
  badges: ^4.0.0
```
Attention! Material ships its own `Badge` widget, so to escape the ambiguous imports you need to import the package like this:

**Option 1: namespace prefix**
```dart
import 'package:badges/badges.dart' as badges;
```
and then use the "badges.Badge" widget instead of the "Badge" widget. The same for all the classes from this package.

**Option 2: hide Flutter's Material Badge widget**
```dart
import 'package:badges/badges.dart';
import 'package:material_ui/material_ui.dart' hide Badge;
// or, if your app hasn't migrated to material_ui yet:
// import 'package:flutter/material.dart' hide Badge;
```
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

`onTap`: when the badge sits outside its child (negative `position` values), the badge adds padding around the child so the whole badge can be tapped. Flutter only delivers taps inside a widget's bounds. The padding makes the widget bigger, so leave `onTap` null if you don't need it.

`ignorePointer: true` lets taps pass through the badge to the widgets below it (and `onTap` is not called).

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

<!-- more-from-yako:start -->
## More from Yako

Other Flutter packages from the same team:

<table>
  <tr>
    <td align="center" valign="top" width="33%">
      <a href="https://pub.dev/packages/settings_ui"><img src="https://raw.githubusercontent.com/yako-dev/.github/main/tiles/settings_ui.gif" width="220" alt="Animated demo of the settings_ui Flutter package: an iOS-style settings screen with Appearance and General sections; turning on Dark mode switches the whole list to dark."></a><br>
      <a href="https://pub.dev/packages/settings_ui"><b>settings_ui</b></a><br>
      <sub>Settings screens that look native on every platform.</sub>
    </td>
    <td align="center" valign="top" width="33%">
      <a href="https://pub.dev/packages/yako_celebrations"><img src="https://raw.githubusercontent.com/yako-dev/.github/main/tiles/yako_celebrations.webp" width="220" alt="Animated demo of the yako_celebrations Flutter package: an epic celebration fills a dark screen with fireworks, flames, spinning coins, confetti and popping Yako logos under a LEVEL UP! title."></a><br>
      <a href="https://pub.dev/packages/yako_celebrations"><b>yako_celebrations</b></a><br>
      <sub>Full-screen celebrations in one line: confetti, coins, fireworks, flames.</sub>
    </td>
    <td align="center" valign="top" width="33%">
      <a href="https://pub.dev/packages/status_alert"><img src="https://raw.githubusercontent.com/yako-dev/.github/main/tiles/status_alert.gif" width="220" alt="Animated demo of the status_alert Flutter package: liking a song shows an Apple-style blurred Loved popup with an icon and a subtitle, which then fades away."></a><br>
      <a href="https://pub.dev/packages/status_alert"><b>status_alert</b></a><br>
      <sub>Apple-style status alerts that hide themselves.</sub>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" width="33%">
      <a href="https://pub.dev/packages/full_screen_menu"><img src="https://raw.githubusercontent.com/yako-dev/.github/main/tiles/full_screen_menu.gif" width="220" alt="Animated demo of the full_screen_menu Flutter package: a blurred full-screen overlay opens over a weather app with five round gradient buttons and a close button."></a><br>
      <a href="https://pub.dev/packages/full_screen_menu"><b>full_screen_menu</b></a><br>
      <sub>A full-screen menu with round gradient buttons.</sub>
    </td>
    <td align="center" valign="top" width="33%">
      <a href="https://pub.dev/packages/yako_theme_switch"><img src="https://raw.githubusercontent.com/yako-dev/.github/main/tiles/yako_theme_switch.gif" width="220" alt="Animated demo of the yako_theme_switch Flutter package: a toggle whose sun thumb rolls into a moon as the screen changes from light mode to dark mode."></a><br>
      <a href="https://pub.dev/packages/yako_theme_switch"><b>yako_theme_switch</b></a><br>
      <sub>An animated switch between light and dark themes.</sub>
    </td>
    <td align="center" valign="top" width="33%">
      <a href="https://pub.dev/packages/diagonal_decoration"><img src="https://raw.githubusercontent.com/yako-dev/.github/main/tiles/diagonal_decoration.png" width="220" alt="Screenshot of the diagonal_decoration Flutter package: one card filled with fine diagonal lines (DiagonalDecoration) and one with a curved line mesh (MatrixDecoration)."></a><br>
      <a href="https://pub.dev/packages/diagonal_decoration"><b>diagonal_decoration</b></a><br>
      <sub>Diagonal-line and mesh backgrounds for boxes.</sub>
    </td>
  </tr>
</table>
<!-- more-from-yako:end -->
