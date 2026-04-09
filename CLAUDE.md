# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Get dependencies
flutter pub get

# Run all tests (with randomized ordering)
flutter test --coverage --test-randomize-ordering-seed random

# Run a single test file
flutter test test/badges_test.dart

# Lint
flutter analyze .

# Format (CI enforces this — run before committing)
flutter format .
```

## Architecture

This is a Flutter package (`badges`) that provides a single `Badge` widget for overlaying notification-style badges on any widget.

### Public API (`lib/badges.dart`)

All public exports go through `lib/badges.dart`. Consumers import as:
```dart
import 'package:badges/badges.dart' as badges;
```
The `as badges` alias is required because Flutter 3.7+ added a `Badge` widget to Material that conflicts.

### Core widget (`lib/src/badge.dart`)

`Badge` is a `StatefulWidget` with `TickerProviderStateMixin`. It manages two `AnimationController`s:
- `_animationController` — drives the content-change animation (slide, scale, fade, size, rotation)
- `_appearanceController` — drives the fade in/out when `showBadge` toggles

The `didUpdateWidget` override is where animation re-triggering logic lives: it watches for changes to `badgeContent` (Text/Icon data), `badgeColor`, `showBadge`, and `loopAnimation`.

When `child` is null, the badge renders standalone. When `child` is provided, it uses a `Stack` with `BadgePositioned` to overlay the badge. When `onTap` is set, extra padding is added to the child and the position is recalculated via `CalculationUtils` to keep the full badge tappable.

### Configuration objects

- **`BadgeStyle`** — visual properties: shape, color, gradient, border, padding, elevation
- **`BadgeAnimation`** — named constructors per animation type (`.slide()`, `.fade()`, `.scale()`, `.size()`, `.rotation()`); each sets the `animationType` field and relevant defaults
- **`BadgePosition`** — named constructors (`topEnd`, `topStart`, `bottomEnd`, `bottomStart`, `center`) plus custom offsets
- **`BadgeGradient`** — named constructors (`.linear()`, `.radial()`, `.sweep()`) wrapping Flutter gradient types
- **`BadgeShape`** — enum: `circle`, `square`, `twitter`, `instagram`

### Custom shapes

`BadgeShape.twitter` and `BadgeShape.instagram` bypass the `Material`/`AnimatedContainer` path and use `CustomPaint` with their respective painters in `lib/src/painters/`. The `DrawingUtils.drawBadgeShape()` helper selects the correct painter.

### Internal utilities (not exported)

- `lib/src/utils/calculation_utils.dart` — computes padding and position adjustments for tappable badges
- `lib/src/utils/gradient_utils.dart` — gradient rendering helpers
- `lib/src/badge_border_gradient.dart` — custom `BoxBorder` subclass that paints a gradient border
- `lib/src/badge_gradient_type.dart` — internal enum used by `BadgeGradient`

### Tests (`test/`)

`badges_test.dart` is the entry point; it imports and calls group functions from `test/badge_animations_tests/`. Tests use `flutter_test` and wrap widgets in `MaterialApp` + `Scaffold`. Animation tests pump specific durations and check `hasRunningAnimations` to assert controller state.
