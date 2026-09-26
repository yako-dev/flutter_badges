## [4.0.1] - [September 26, 2026]

* README: a **More from Yako** grid with an animated preview of each of our other packages.

## [4.0.0] - [September 24, 2026]

### Breaking Changes
* **Migrated to `package:material_ui`** (#135, thanks @mayainle) — Material and Cupertino were decoupled from the Flutter SDK in Flutter 3.47 and now ship as standalone packages. This package now imports `package:material_ui/material_ui.dart` instead of `package:flutter/material.dart`.
  * In apps that use `material_ui`, badge content now gets the app's theme text style without `MaterialUiCompatibilityBridge`. Apps still on `package:flutter/material.dart` keep working, but badge text uses the default Material text style until they migrate. This is a major version bump, as the Flutter team recommends for this migration.
  * To hide the ambiguous `Badge`, use `import 'package:material_ui/material_ui.dart' hide Badge;` instead of the Flutter Material equivalent.
* **Minimum SDK raised** to Dart `3.13.0` / Flutter `3.47.0`, the floor required by `material_ui`.

### Bug Fixes
* **Issue #133** — The `ignorePointer` docs said the opposite of what it does. `true` lets taps pass through the badge; `false` (default) lets the badge get taps.
* **`BadgeStyle.elevation` works again.** It has drawn no shadow since 3.0.3. The default is now `0`, so badges that don't set it look the same as before.
* **`BadgePosition.center()` with `onTap`** no longer moves the badge to the top-left corner.
* **`BadgePosition.centerStart()` / `centerEnd()`** are now vertically centered, as documented.
* **Right-to-left layouts with `onTap`** no longer shift the badge. The tap padding is now directional.
* **Hidden badges (`showBadge: false`)** no longer catch taps or call `onTap`; taps reach the widget below.
* **Twitter / Instagram shapes** no longer crash with gradients of 3+ colors. Gradient `stops`, `tileMode`, sweep angles and directional alignments are now used.
* **Turning `toAnimate` on at runtime** no longer leaves the badge invisible.
* Fixed a listener leak: every rebuild added a listener to the appearance controller.
* Removed a no-op `ConstrainedBox`. The 3.2.0 "minimum-square sizing" note was wrong: badge sizing did not change in 3.2.0 and does not change now.

### Maintenance
* Replaced `SizeTransition.axisAlignment`, deprecated after Flutter v3.41, with `alignment`. `BadgeAnimation.sizeTransitionAxisAlignment` is unchanged and still takes a `double`.
* CI: removed the broken "Code Quality" workflow, set up pub.dev automated publishing in the publish workflow, updated actions, added a weekly run on Flutter beta.
* Example app: regenerated Android / iOS / Windows projects so it builds again, and fixed the test screen overflowing on phone widths.
* Smaller pub.dev archive (`.pubignore`).
* README: fixed build and downloads badges, documented `onTap` padding and `ignorePointer`.

## [3.2.0] - [April 9, 2026]

### Bug Fixes
* **Issue #114** — Fixed `showBadge: false` being ignored when a loop animation is active. `didUpdateWidget` now handles `showBadge` changes before any loop-animation guards.
* **Issue #130** — `showBadge: false` now hides the badge immediately. `_animationController.stop()` and `_appearanceController.stop()` are called before `reverse()` so the badge does not wait for the animation to play through.
* **Issue #98** — Fixed border anti-aliasing artifact. Border is now drawn entirely inside the circle via `strokeAlign: BorderSide.strokeAlignInside` in `BoxDecoration`, preventing background-colour bleed at antialiased edges.
* **Issue #115 (partial)** — Key-based animation re-trigger: setting a `Key` on `badgeContent` and changing it now restarts the animation for any widget type, not just `Text` and `Icon`.

### New Features
* **`BadgeStyle.copyWith`** — Returns a copy of a `BadgeStyle` with overridden fields.
* **`BadgePosition.centerStart`** — New named constructor: badge vertically centered on the start (left) side.
* **`BadgePosition.centerEnd`** — New named constructor: badge vertically centered on the end (right) side.
* **`BadgeState.animationController` / `appearanceController` getters** — Public access to the internal animation controllers for advanced use cases (PR #128).
* **`_BadgeVisual` private widget** — Extracted badge visual from an inner closure into a proper `StatelessWidget` so Flutter's element tree can cache it and avoid rebuilding the full subtree on every opacity tick (PR #120).
* **Minimum-square badge sizing** — Single-character text and small-icon badges now maintain correct circular/square proportions (PR #111).
* **`BadgeGradient.gradient()` asserts** — Added `assert` statements documenting constructor invariants instead of silently force-unwrapping nullable fields.
* **Controller duration updates** — `didUpdateWidget` now updates `AnimationController` durations when `badgeAnimation` duration properties change.

### Example App & Docs
* Fixed all lint warnings in `example/` (`use_super_parameters`, `prefer_final_fields`, `curly_braces_in_flow_control_structures`, `avoid_print`, `deprecated_member_use`).
* README: fixed showcase GIF height (`600px` → `400px`).
* README: added `hide Badge` import pattern (issue #123).
* Bumped `flutter_lints` to `^6.0.0`.

## [3.1.2] - [August 28, 2023]
* Update Dart SDK version. Update readme.

## [3.1.1] - [April 14, 2023]
* Return to 3.0.3 version functionality due to bug

## [3.1.0] - [April 11, 2023]
* Add BadgeShape.triangle
* Fix custom shapes deformation depending on the badge content

## [3.0.3] - [March 24, 2023]
* Fix transparent color for the badge

## [3.0.2] - [Jan 25, 2023]
* Due to Badge widget introduction in Material library, the package is refatored to avoid ambiguous imports. badges.Badge used everywhere.
* Readme updated

## [3.0.0-beta.1] - [Dec 25, 2022]
* Add onTap for Badge
* Add Twitter and Instagram shapes
* Add size, rotation and color change animation for Badge
* Add loop animation
* Add border gradient
* Add more customization for animation and style
* Breaking changes! Please check the readme for simple migration guide 

## [2.0.3] - [Jun 2, 2022]
* Fix border radius of the badge, when using it with gradient

## [2.0.2] - [Jul 28, 2021]
* Add `gradient` parameter to the `Badge`
* Add `BadgePosition.center()` as a new factory constructor for the `BadgePosition` 

## [2.0.1] - [May 13, 2021]
* Add parameter to edit fit parameter Stack widget

## [2.0.0] - [April 20, 2021]
* Stable null safety

## [2.0.0-nullsafety.1] - [March 13, 2021]
* Null safety, finally! Prerelease

## [1.2.0] - [March 4, 2021]
* Breaking change! Deprecated parameter 'Overflow' replaced with 'Clip' for Stack widget.
* Documentation implementation

## [1.1.6] - [December 8, 2020]
* Fix error parameter with the name 'clipBehavior'

## [1.1.5] - [December 7, 2020]
* Add borderSide parameter to customize the badge border
* Fix issue where null border radius was provided

## [1.1.4] - [October 23, 2020]
* Migrate Android embedding v2, fix overflow issue
* Ignore pointer option for Badge
* Custom border radius for Badge

## [1.1.3] - [September 22, 2020]
* Fix for deprecated overflow parameter on Stack widget

## [1.1.2] - [August 27, 2020]
* RTL devices support

## [1.1.1] - [February 27, 2020]
* Add alignment parameter to define position of the whole widget

## [1.1.0] - [July 2, 2019]
* Added showBadge parameter to hide or show badge with animation

## [1.0.3] - [June 5, 2019]
* Fixed a bug when all the badges on the screen are animated if one of them is updated. Fixed only for badges that have Text or Icon in badge content. 

## [1.0.2] - [June 5, 2019]
* Updated versions in readme.

## [1.0.1] - [June 4, 2019]
* Updated readme images and lib description.

## [1.0.0] - [June 4, 2019]
* Badge class for creating badges for every widget.
