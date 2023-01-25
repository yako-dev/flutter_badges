
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
