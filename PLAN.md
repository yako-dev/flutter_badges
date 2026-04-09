# flutter_badges — Renovation Plan

> Track progress across sessions. Check off items as they are completed.
> Current Flutter: **3.41.6** | Dart: **3.11.4** | Package version: **3.1.2**

---

## Phase 1 — Dependency & Tooling Updates ✅ Completed

- [x] **1.1** Bumped `flutter_lints` `^2.0.1` → `^6.0.0` in main package
- [x] **1.2** Example app: replaced `pedantic ^1.11.1` (discontinued) with `flutter_lints ^6.0.0`, removed unused `integration_test` dep, bumped `cupertino_icons ^1.0.4` → `^1.0.8`
- [x] **1.3** Updated flutter SDK lower bound `">=0.2.5"` → `">=3.10.0"` in both pubspec files (Flutter 3.10 is where Dart 3.0 landed)
- [x] **1.4** Ran `flutter pub upgrade`; lockfiles are gitignored so not committed
- [x] Fixed 3 `use_super_parameters` lint warnings introduced by the new lint rules (`Badge`, `BadgePositioned`, `TestWidgetScreen`)

---

## Phase 2 — Bug Fixes (Open Issues)

- [ ] **2.1** **Issue #114 — `showBadge` ignored when fade loop animation is active**
  - PR #122 proposes a fix (touches `badge.dart`, `badge_animation.dart`, `README.md`) — review, test, and merge or reimplement cleanly
  - Reproduce: `BadgeAnimation.fade(animationDuration: Duration(milliseconds: 2000), loopAnimation: true)` + `showBadge: false`

- [ ] **2.2** **Issue #130 — `showBadge` is slow to respond when animation is on**
  - Related to #114; the animation controller's `reverse()` waits for full duration before hiding
  - Consider calling `_animationController.stop()` before `reverse()` in `didUpdateWidget` when `showBadge` flips to false

- [ ] **2.3** **Issue #98 — Border anti-aliasing artifact (thin inner border visible)**
  - Visible on circle and square shapes when `borderSide` is set
  - Investigate `BoxDecoration` + `Material` layering — likely needs `AntiAlias` clip or painter approach

- [ ] **2.4** **Issue #115 — Animation not working (general)**
  - The `didUpdateWidget` re-trigger only checks `Text.data` and `Icon.icon` for content changes — any other widget type (e.g. `Image`, custom widget) will never re-trigger the animation
  - Consider a more general approach: always re-trigger on any `badgeContent` widget identity change

---

## Phase 3 — Open PRs Review

- [ ] **3.1** **PR #122 — Fix for issue #114 (showBadge + loop fade)**
  - Small change to `badge.dart` and `badge_animation.dart`
  - Review the diff carefully; test all animation types with `loopAnimation: true` + `showBadge: false`
  - Decision: merge, close, or reimplement in 2.1

- [ ] **3.2** **PR #120 — Replace private helper methods with private widgets**
  - Moves `_getBadge()` helper method into a proper `StatelessWidget` subclass for Flutter's build system to cache correctly
  - This is a real performance improvement — Flutter can't cache widgets returned from methods
  - Review the 225-line diff; ensure tests still pass; merge if clean

- [ ] **3.3** **PR #128 — Expose `animationController` and `appearanceController`**
  - Adds public getters for the two internal `AnimationController`s (issue #127)
  - Evaluate whether exposing internal controllers is the right API vs. providing a `BadgeController` abstraction
  - Decision: merge as-is, redesign as a controller object, or close

- [ ] **3.4** **PR #111 — Fix display of square badge with small content size + triangle shape**
  - Fixes badge proportions for small content (e.g. single icon with no text)
  - Also adds a new `BadgeShape.triangle` with its own painter
  - Large diff (400+ lines); needs thorough review and tests
  - Decision: merge, split into two PRs (fix vs. new shape), or reimplement

---

## Phase 4 — Code Quality & Improvements

- [ ] **4.1** **Fix all 201 lint warnings** — almost entirely `prefer_const_constructors` and `prefer_const_literals_to_create_immutables` in the example app; one `deprecated_member_use` (`withOpacity` → `withValues()`) in `instagram_verified_account.dart`
  - Run: `flutter format .` then fix remaining analyzer issues

- [ ] **4.2** **Replace private widget helper method with a widget class** (if PR #120 is not merged)
  - `_getBadge()` in `badge.dart:147` returns a widget from a method — Flutter rebuilds the full subtree on every frame change rather than diffing the widget tree
  - Extract to a `_BadgeContent` `StatelessWidget`

- [ ] **4.3** **Audit `didUpdateWidget` animation re-trigger logic** (`badge.dart:262–330`)
  - Currently only `Text` and `Icon` widget types trigger re-animation on content change
  - All other `badgeContent` widget types are silently ignored
  - Design a cleaner general-purpose solution

- [ ] **4.4** **Consider adding `BadgeController`** (related to issue #127 / PR #128)
  - A dedicated controller object (`BadgeController`) that lets users imperatively trigger animations, similar to `TabController` or `ScrollController`
  - Would be a cleaner API than exposing raw `AnimationController` internals

- [ ] **4.5** **`BadgePosition` — missing positions**
  - No `centerLeft`, `centerRight`, `topCenter`, `bottomCenter` convenience constructors (mentioned in historical issues)
  - Add these named constructors with sensible defaults

- [ ] **4.6** **`BadgeStyle` — `copyWith` method missing**
  - None of the data classes (`BadgeStyle`, `BadgeAnimation`, `BadgePosition`, `BadgeGradient`) have `copyWith`
  - Add `copyWith` to at least `BadgeStyle` and `BadgeAnimation`

- [ ] **4.7** **`BadgeGradient.gradient()` uses force-unwrap (`!`)**
  - `badge_gradient.dart:67–97` uses `begin!`, `end!`, `center!`, etc.
  - These are safe due to the named constructors but worth documenting or asserting

---

## Phase 5 — Example App

- [ ] **5.1** Fix the example app so it builds cleanly:
  - Remove discontinued `pedantic` dep, add `flutter_lints`
  - Fix all 201 lint issues (mostly missing `const`)
  - Replace `withOpacity()` → `withValues()` in `instagram_verified_account.dart:13`
  - Remove `avoid_print` violation in `yako_app.dart:24`

- [ ] **5.2** Verify all example screens render correctly on current Flutter:
  - `alarm_app.dart`, `flag_app.dart`, `human_avatar.dart`, `instagram_message.dart`
  - `instagram_verified_account.dart`, `twitter_verified_account.dart`, `yako_app.dart`
  - `test_screen.dart`

- [ ] **5.3** Add a demonstration of the new features/fixes added in this renovation (e.g. new positions, copyWith, controller if added)

---

## Phase 6 — Tests ✅ Completed

**174 tests passing, 1 skipped (known bug #114).**

Changes made:
- **Rewrote `content_change_badge_animation_tests.dart`**: removed illegal direct calls to `state.didUpdateWidget()` — tests now use `TestWidgetScreen` with `setState` so the framework calls `didUpdateWidget` naturally.
- **Fixed `show_hide_badge_animation_tests.dart`**: renamed duplicate test name `'Show hide Badge Animation With Different Duration Test'` → `'Show hide Badge Animation Longer Appearance Duration Test'`.
- **Cleaned `utils_tests.dart`**: removed unnecessary `async` keyword from all unit tests that do no async work.
- **Added new test groups to `badges_test.dart`**:
  - `Badge without child` — standalone rendering, onTap fires, ignorePointer absorbs taps (also discovered: `SlideTransition` uses `FractionalTranslation` which shifts the hit-test area — `pumpAndSettle()` required before tapping)
  - `showBadge false at initial render` — no animation, opacity=0, and badge re-appears when flipped to true
  - `BadgePosition factory defaults` — all named constructors verified
  - `Icon content change triggers animation` — changing icon data restarts animation; same icon data does not
  - `Non-Text/non-Icon content change does not re-trigger animation` — documents the current limitation (only `Text.data` and `Icon.icon` are tracked)
  - `Issue #114 regression` — **skipped** with `skip: true`; documents the root cause (early `return` in the `loopAnimation && isAnimating` branch of `didUpdateWidget` prevents `_appearanceController.reverse()` from being called). Remove `skip` when bug is fixed in Phase 2.
- **Note on `GestureDetector` vs `ElevatedButton` in tests**: `ElevatedButton` ripple animations pollute `hasRunningAnimations`; always use `GestureDetector` when you need to trigger `setState` without introducing extra animations.

Remaining test work (deferred to other phases):
- [ ] Add tests for `copyWith` methods once added (Phase 4.6)
- [ ] Add tests for new `BadgePosition` constructors (Phase 4.5)
- [ ] Remove `skip: true` from issue #114 test after fix in Phase 2
- [ ] Consider raising CI coverage threshold from 35% → 70%+ after Phase 4

---

## Phase 7 — Documentation & README

- [ ] **7.1** **Issue #126 — README main GIF proportions** — the showcase GIF has wrong aspect ratio; regenerate or fix the `height` attribute in the README `<img>` tag
- [ ] **7.2** **Issue #123 — Document the `hide Badge` import pattern**
  - Add to README: `import 'package:flutter/material.dart' hide Badge;` as an alternative to the `as badges` prefix approach
- [ ] **7.3** Update README version badge and pubspec version after all changes are done
- [ ] **7.4** Update `CHANGELOG.md` to document all changes made

---

## Phase 8 — Release

- [ ] **8.1** Decide on version bump: patch (3.1.3) if only bug fixes, minor (3.2.0) if new features/API additions
- [ ] **8.2** Run full test suite with randomized order: `flutter test --coverage --test-randomize-ordering-seed random`
- [ ] **8.3** Run `flutter analyze .` — must exit 0
- [ ] **8.4** Run `flutter format --set-exit-if-changed .`
- [ ] **8.5** Publish: `flutter pub publish`

---

## Notes & Decisions Log

_Use this section to record decisions made during the renovation._

| Date | Decision |
|------|----------|
| — | — |
