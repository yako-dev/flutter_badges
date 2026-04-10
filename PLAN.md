# flutter_badges — Renovation Plan

> Track progress across sessions. Check off items as they are completed.
> Current Flutter: **3.41.6** | Dart: **3.11.4** | Package version: **3.2.0**

---

## Phase 1 — Dependency & Tooling Updates ✅ Completed

- [x] **1.1** Bumped `flutter_lints` `^2.0.1` → `^6.0.0` in main package
- [x] **1.2** Example app: replaced `pedantic ^1.11.1` (discontinued) with `flutter_lints ^6.0.0`, removed unused `integration_test` dep, bumped `cupertino_icons ^1.0.4` → `^1.0.8`
- [x] **1.3** Updated flutter SDK lower bound `">=0.2.5"` → `">=3.10.0"` in both pubspec files (Flutter 3.10 is where Dart 3.0 landed)
- [x] **1.4** Ran `flutter pub upgrade`; lockfiles are gitignored so not committed
- [x] Fixed 3 `use_super_parameters` lint warnings introduced by the new lint rules (`Badge`, `BadgePositioned`, `TestWidgetScreen`)

---

## Phase 2 — Bug Fixes (Open Issues) ✅ Completed

- [x] **2.1** **Issue #114 — `showBadge` ignored when fade loop animation is active**
  - Restructured `didUpdateWidget` so `showBadge` changes are handled **before** any loop-animation guards. The early-return that blocked `_appearanceController.reverse()` is gone.

- [x] **2.2** **Issue #130 — `showBadge` is slow to respond when animation is on**
  - `_animationController.stop()` + `_appearanceController.stop()` are now called before `reverse()` when `showBadge` flips to false, so hiding is immediate.

- [x] **2.3** **Issue #98 — Border anti-aliasing artifact (thin inner border visible)**
  - Border moved from `Material.shape` into `BoxDecoration` with `strokeAlign: BorderSide.strokeAlignInside`. Material shape uses `CircleBorder()` / `RoundedRectangleBorder()` with no side (elevation shadow only). `gradientBorder` → `boxBorder` typed as `BoxBorder?`.

- [x] **2.4** **Issue #115 — Animation not working (general)**
  - Added key-based re-trigger: if `badgeContent` has a `Key` and it changes, the animation restarts. Handles all widget types beyond `Text` and `Icon`.

---

## Phase 3 — Open PRs Review ✅ Completed

- [x] **3.1** **PR #122 — Fix for issue #114 (showBadge + loop fade)**
  - Our Phase 2.1 fix supersedes this PR. Cleaner restructuring of `didUpdateWidget`.

- [x] **3.2** **PR #120 — Replace private helper methods with private widgets**
  - Extracted `badgeView()` inner closure into `_BadgeVisual` `StatelessWidget` in `badge.dart`. Flutter's element tree now caches it across appearance controller ticks.

- [x] **3.3** **PR #128 — Expose `animationController` and `appearanceController`**
  - Added public getters `animationController` and `appearanceController` to `BadgeState`.

- [x] **3.4** **PR #111 — Fix display of square badge with small content size**
  - Wrapped badge content in `ConstrainedBox` + `IntrinsicWidth` inside `_BadgeVisual` so single-character / small-icon badges stay proportional.

---

## Phase 4 — Code Quality & Improvements ✅ Completed

- [x] **4.1** **Fixed all 16 lint warnings in `example/`**
  - `use_super_parameters` in alarm_app, flag_app, human_avatar, instagram_message, instagram_verified_account, twitter_verified_account, yako_app, test_screen
  - `prefer_final_fields` in alarm_app (`_isLooped`)
  - `deprecated_member_use` (`withOpacity` → `withValues`) in instagram_verified_account
  - `use_key_in_widget_constructors` + `library_private_types_in_public_api` in main.dart
  - `curly_braces_in_flow_control_structures` in test_screen.dart
  - `avoid_print` in yako_app.dart (removed print)

- [x] **4.2** **Replaced `badgeView()` helper method with `_BadgeVisual` widget class** — covered by 3.2

- [x] **4.3** **Audited `didUpdateWidget`** — fully restructured with clear priority ordering; covered by 2.1

- [x] **4.4** **Controller getters** — covered by 3.3 (public `animationController` + `appearanceController` getters on `BadgeState`)

- [x] **4.5** **`BadgePosition` — added `centerStart` and `centerEnd` named constructors**

- [x] **4.6** **`BadgeStyle.copyWith`** — added `copyWith` method covering all 8 fields

- [x] **4.7** **`BadgeGradient.gradient()` asserts** — added `assert` statements in each `switch` case documenting constructor invariants instead of silently force-unwrapping

---

## Phase 5 — Example App ✅ Completed

- [x] **5.1** Fixed all 16 lint issues in `example/` — see 4.1 above
- [x] **5.2** Example app builds cleanly with no analyzer warnings

---

## Phase 6 — Tests ✅ Completed

**175 tests passing, 0 skipped.**

Changes made:
- **Rewrote `content_change_badge_animation_tests.dart`**: removed illegal direct calls to `state.didUpdateWidget()` — tests now use `TestWidgetScreen` with `setState` so the framework calls `didUpdateWidget` naturally.
- **Fixed `show_hide_badge_animation_tests.dart`**: renamed duplicate test name.
- **Cleaned `utils_tests.dart`**: removed unnecessary `async` keyword from unit tests.
- **Added new test groups to `badges_test.dart`**:
  - `Badge without child`
  - `showBadge false at initial render`
  - `BadgePosition factory defaults`
  - `Icon content change triggers animation`
  - `Non-Text/non-Icon content change does not re-trigger animation`
  - `Issue #114 regression` — now passing (was previously skipped)
- **Removed `skip: true`** from the issue #114 regression test after Phase 2 fix.

---

## Phase 7 — Documentation & README ✅ Completed

- [x] **7.1** Fixed README main GIF height: `600px` → `400px`
- [x] **7.2** Added `hide Badge` import pattern (Option 2) to README
- [x] **7.3** Bumped version: `3.1.2` → `3.2.0` in `pubspec.yaml` and README
- [x] **7.4** Updated `CHANGELOG.md` with all changes for 3.2.0

---

## Phase 8 — Release

- [x] **8.1** Version bump: `3.2.0` (new features: `copyWith`, new positions, controller getters, key-based animation trigger, `_BadgeVisual` widget, min-square sizing)
- [x] **8.2** All 175 tests passing
- [x] **8.3** `flutter analyze lib/ test/ example/` — 0 issues
- [x] **8.4** `dart format .` — all files formatted
- [ ] **8.5** Publish: `flutter pub publish` — intentionally skipped per task instructions

---

## Notes & Decisions Log

| Date | Decision |
|------|----------|
| 2026-04-09 | PR #122 superseded by cleaner Phase 2.1 restructure of `didUpdateWidget` |
| 2026-04-09 | PR #111 triangle shape deferred; only size-fix implemented |
| 2026-04-09 | `BadgeController` abstraction (issue #127 / PR #128) deferred; raw controller getters added as simpler API |
| 2026-04-09 | `copyWith` added to `BadgeStyle` only (not `BadgeAnimation` / `BadgePosition` — lower demand) |
